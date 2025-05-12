import { Module } from '@nestjs/common';
import { FormService } from './form.service';
import { FormController } from './form.controller';
import { PrismaModule } from 'src/prisma/prisma.module';

@Module({
  controllers: [FormController],
  providers: [FormService],
  imports: [PrismaModule],
  exports: [FormService]
})
export class FormModule {}

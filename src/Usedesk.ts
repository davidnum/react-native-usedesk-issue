import {NativeModules} from 'react-native';

// https://github.com/usedesk/UseDeskSwift
interface IInitChatParams {
  // *идентификатор компании
  withCompanyID: string;
  // *идентификатор канала
  chanelId: string;
  // *Адрес API. Стандартное значение secure.usedesk.ru/
  urlAPI: string;
  // *адрес сервера в формате - pubsubsec.usedesk.ru
  url: string;
  // *личный API ключ
  api_token: string;
  // идентификатор базы знаний. Если не указан,база знаний не используется
  knowledgeBaseID?: string;
  // почта клиента
  email?: string;
  // телефон клиента
  phone?: string;
  // Адрес для отправки файлов. Стандартное значение https://secure.usedesk.ru/uapi/v1/send_file
  urlToSendFile?: string;
  // порт сервера
  port?: string;
  // имя клиента
  name?: string;
  // имя оператора
  operatorName?: string;
  // имя чата. Отображается в шапке
  nameChat?: string;
  // автоматическое сообщение. Отправиться сразу после иницилизации от имени клиента
  firstMessage?: string;
  // текст заметки
  note?: string;
  // подпись, однозначно идентифицирующая пользователя и его чат на любых устройствах для сохранения истории переписки.
  // (генерирует наша система, ограничение не меньше 64 символа)
  //
  // приходит первым аргументом в successCb
  token?: string;
  // идентификатор языка. Доступные языки:
  // русский ("ru"),
  // английский ("en"),
  // португальский ("pt"),
  // испанский ("es").
  // Если переданный идентификатор не поддерживается, будет выбран русский язык.
  localeIdentifier?: string;
}

interface UsedeskService {
  start(
    params: IInitChatParams,
    /*
     * @params {userToken} - подпись, однозначно идентифицирующая пользователя и его чат на любых устройствах для сохранения истории переписки.
     * */
    successCb?: (userToken: string) => void,
    /*
     * описание кода ощибок http://sdk.usedocs.ru/article/24946
     * */
    errorCb?: (error: {code: string}) => void,
  ): Promise<void>;
}

export const Usedesk: UsedeskService = NativeModules.Usedesk;

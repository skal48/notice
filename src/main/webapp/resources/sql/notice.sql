DROP SEQUENCE NOTICE_SEQ;
CREATE SEQUENCE NOTICE_SEQ NOCACHE;

DROP TABLE NOTICE_T;
CREATE TABLE NOTICE_T (
    NOTICE_NO NUMBER NOT NULL,           /* ������ȣ */
    GUBUN NUMBER(1) NOT NULL,            /* ��������(1='���', 2='�Ϲ�') */
    TITLE VARCHAR2(1000 BYTE) NOT NULL,  /* ���� */
    CONTENT CLOB                         /* ���� */
);

INSERT INTO NOTICE_T VALUES(NOTICE_SEQ.NEXTVAL, 2, '���� �̺�Ʈ', 'Ǫ���� ��ǰ�� �����մϴ�.');
INSERT INTO NOTICE_T VALUES(NOTICE_SEQ.NEXTVAL, 2, 'ȭ�� ����', '���� ȭ���� ����˴ϴ�.');
INSERT INTO NOTICE_T VALUES(NOTICE_SEQ.NEXTVAL, 1, '�۾� ����', '00 ~ 03�� �۾����� �ý����� �ߴܵ˴ϴ�.');
INSERT INTO NOTICE_T VALUES(NOTICE_SEQ.NEXTVAL, 1, '���� ����', '07 ~ 09�� ���������� ������ �ֽ��ϴ�.');
INSERT INTO NOTICE_T VALUES(NOTICE_SEQ.NEXTVAL, 2, '���� �̺�Ʈ', '10�ֳ� ��� 30% ���� �̺�Ʈ�� �ǽ��մϴ�.');
COMMIT;
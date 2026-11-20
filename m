Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207812;
	b=Nl1rDV3Q6hs1rBcqq4D4WOhEMITeDllA8DYhDVDsIrgtnkuTjCvbMuaIsWMUxfOrhOw6
	 s1SXVwjnhH96bVPXliR3+10gZYbV+bnCjNkOFuxS4TVbuS0gt66gpBgo90utvrcQaQdhC
	 F59killguv/BRmSGTA6mn+WHCaZc1hH0dSV8zmTVGonAdf7mabwtzhZXPJ/SkJtW/1RCU
	 nlwqCW27uyhuE3WP/rsZyH6+wmZFcH4E4NR7SXgGBMGHSAWhzw6oM8L6OTYn/KjPHJQ25
	 /VT3zIHQ90lnn1X6oRZWoDsVZmgQM7Ok+zsJp2itRwcMXBKS5Cotyu2NfHGVwaEWrrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207812;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:X-DetectorID-Processed:Content-Type;
	bh=0GCTwnyFTV7Nq421JlddcJggFeEG/9+qiQH/b/hIPk4=;
	b=ns4L0qnQ2SwXemGnzE88gI3c9XaNfVNeD6lzOkB87uEbdxGrD8N7NsMjIOvgwOPq7Z0L
	 uRWGRp5BsLCa0CBm3D3EowZF3msj+q6QDfE/71E6YAPvxekbBGQFLhf3ZY9h9H+Cx6hxX
	 8/L0FJJqOixtB1OeArebwp7Z7XQxis69H30e2iH8FG7deWm18a2+cCsqHMmQW3iiSgyLr
	 Dc7hGgoPQ3BGprcpvoR5+ystzt1qoLgpJ1RTQVrCoZx95LJKSModvA8EQVxqRGvccu0tf
	 UzGfmqcKflgZLWQT+aaR3eHzBICiKJSS2vDVRkuwSFgYA00rDhAtlL2NjYEJwEq854w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dhJ7PTQS;
	arc=none smtp.remote-ip=209.85.214.227
Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B500606A6AC
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B500606A6AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dhJ7PTQS
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2f0481b35c9so6651825ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:50:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207808; x=1795812608;
        h=content-type:to:subject:message-id:date:from:mime-version
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0GCTwnyFTV7Nq421JlddcJggFeEG/9+qiQH/b/hIPk4=;
        b=pEMB6acuiQYMtiw1inQqvDJTAMNPS2eND4uTtXVsjfF8hA8F0OWrF/bxzQkRC2pjsr
         rpAbCrSVF26QrqtbZb3gEROtqN/SkbN6EUpMvQq/YrzPUbNGOKrhfRAvJQpFMVYeP0lp
         HMmg3A642nskhhm9z5aBsl6CDUVx222aJG4eLwlwJA0aRXDh+e7fzPz/xkbp9H5QvIm+
         OBdUMW3KNAs7BXfu8R79w5aS9qlwPb6KHD0+3n1DLnHpyPhmdVAfTJRLj40ogAcSQFJ1
         Z4HGN5/ZH6mGCGbhtZfr5r2vHcWrIfPGOtVCn3WQrulNA9oGeC9O+OSYUNuppWEQjBsH
         emsg==
X-Forwarded-Encrypted: i=1; AL+hErEdMk9RRzTW95o2ErUmbZ22RtcUplLrO+c3KsoDezAorr2j2tYu+vQlOCUnIwJ/CYDAktmg/fISANL8M9U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Y+bpl1WTwZadR3QyC2p5DCqNxfVEgAkKwZDqfRtnatpAYBIHr
	3LdlBINoy+LoBCOA7ygdsFxsVCW32B9wU8e56BMsK/5egm28FEToCBHunTzOgzivZMVg20mF6iZ
	QJqZbkmzCju6MbL1dmQYMuZB+hAkuaCbYABKD2eCRu0DuGUn9OahorOaWVeNJ4QVgXAu+sO1U7f
	ok9QqYuw4PzDvqwAwCVO5v3MjPLqiXz8kC16qzkiL5nou0N4kPRU3//zduq/vziOUFkYcXDXkJN
	sF4REb8Vr1WvA==
X-Gm-Gg: AZFdTZeGRs4vzHb1X0oyrHNjdNT2Zad+083363alxzUtlpKSq5GMew9FfLxoSMAxR64
	QG5BIMiw2sl0huMidJpEbfiw9TMju6CbwHzIvWNHD3+8BV8ob5puCRDj8sz2yJJiEI8AZJWH81h
	00srHwamYANo2v4NTdh1gh6p2aAJTaMyLjBv8VLyeXpr7oaOt2H7RaAvMLZvshZArYZRBIEqTT/
	9gXnbt0WZp3nDRebpV809gdDA5Vs9sAnKp20Vhff53ernNkw9rfZXpzbU9Jiy497gn+u2rO80AP
	dtEslkEI0rhs1hRqvDjcGsDHFXe2sw4ZCEjXi+JiAJ3D4RUWw1MdrT7y+JsEcmaR5rIPywfFCVO
	ZX18qbViIHiEb1En6ku1FkW5KLyf9IGv9tLgSYHekW1eQU96AOAUNGxqPEgjx+hq/xAzs4DlbTQ
	B5LMDjNF/n1gL/KnqXKXihD+pjGUqRvkjA
X-Received: by 2002:a17:90b:4983:b0:3ac:403d:6239 with SMTP id 98e67ed59e1d1-3b41caeb091mr3501745a91.43.1795207807760;
        Fri, 20 Nov 2026 12:50:07 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ac84fd5sm2666416a91.2.2026.11.20.12.50.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2026 12:50:07 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b0bf2140b7so19573267b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795207806; x=1795812606; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0GCTwnyFTV7Nq421JlddcJggFeEG/9+qiQH/b/hIPk4=;
        b=dhJ7PTQSms/I2mQh24VF8vDuD4Yy8yldIiNHZZ/0tO+4RoNUS09L+BY6kpA7rU4TYg
         u0BW4J+6AmzVwSffUtpOUiwpsLgVB6ePzd0w5JZyX2wRtTfGeEIUySSlaITX4tCoZCQ+
         22UG4soXJU6udC7w9DT3yiC0pulq4dFc0LS9c=
X-Forwarded-Encrypted: i=1; AL+hErGVClOfUyMWfVi2SR07xJBrU/MACO4E5WF9Bf7B/33YI7jmaIZxSgKq01DxZaeE0fmfCzAEa09oKzSUMXo=@vger.kernel.org
X-Received: by 2002:a05:690c:e908:b0:8b3:3956:6f7e with SMTP id 00721157ae682-8b52043cdd0mr18592897b3.12.1795207806370;
        Fri, 20 Nov 2026 12:50:06 -0800 (PST)
X-Received: by 2002:a05:690c:e908:b0:8b3:3956:6f7e with SMTP id
 00721157ae682-8b52043cdd0mr18592807b3.12.1795207805966; Fri, 20 Nov 2026
 12:50:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Paul Ely <paul.ely@broadcom.com>
Date: Fri, 20 Nov 2026 15:49:54 -0500
X-Gm-Features: Aa3M54r6QwEBfV1B6KlwQtAuN8l6g1Wkip5X_go3_xJ3QB0fmhCGgqbx6HtIxnU
Message-ID: <CAEQnVQmvXfXov0XmTNZ7V7iPhSUxgtPHJwC1o5HZkkwo0dozvg@mail.gmail.com>
Subject: Re: [PATCH] scsi: lpfc: Fix format string and OOB copy in lpfc_read_object()
To: irogers@google.com, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nigel Kirkland <nigel.kirkland@broadcom.com>, mkp@kernel.org, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000009cacd80660bb6384"

--0000000000009cacd80660bb6384
Content-Type: text/plain; charset="UTF-8"

From: Ian Rogers <irogers@google.com>
To: Justin Tee <justin.tee@broadcom.com>,
Paul Ely <paul.ely@broadcom.com>,
"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
"Martin K. Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>,
Ian Rogers <irogers@google.com>
Subject: [PATCH] scsi: lpfc: Fix format string and OOB copy in
lpfc_read_object()
Date: Thu, 19 Nov 2026 09:05:00 -0800 [thread overview]
Message-ID: <20261119170500.1514537-1-irogers@google.com> (raw)

In lpfc_read_object(), rd_object_name is a 26-element u32 array (104
bytes, LPFC_OBJ_NAME_SZ) populated from rdobject via scnprintf() without a
"%s" format string, and then copied to the SLI-4 mailbox request with:

for (j = 0; j < strlen(rdobject); j++)
read_object->u.request.rd_object_name[j] =
cpu_to_le32(rd_object_name[j]);

Because the loop bound uses strlen(rdobject) (byte count, unbounded) to
index 32-bit dword arrays of length 26, any object path of 27 bytes or
longer reads past the end of rd_object_name on the stack and overwrites
rd_object_cnt, rd_object_hbuf[], and adjacent mailbox memory. Passing
rdobject directly as the format string also evaluates any '%' characters
as printf specifiers.

Format rdobject with "%s", capture the bounded byte length returned by
scnprintf(), and iterate over DIV_ROUND_UP(len, sizeof(u32)) dwords.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wformat-security enabled; fix and changelog drafted with an AI coding
assistant. Verified with an ASan/UBSan C reproducer for short, '%'-bearing,
and >104-byte object names, and build-tested with LLVM=1 W=1 and
-Wformat-security; not tested on Emulex Fibre Channel hardware.

Fixes: 72df8a452883 ("scsi: lpfc: Add support for cm enablement buffer")
Fixes: 59936430e6a6 ("scsi: lpfc: Fix CPU to/from endian warnings
introduced by ELS processing")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/scsi/lpfc/lpfc_sli.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c
index 9173263c87f9..26c9f5721340 100644
--- a/drivers/scsi/lpfc/lpfc_sli.c
+++ b/drivers/scsi/lpfc/lpfc_sli.c
@@ -22259,11 +22259,12 @@ lpfc_read_object(struct lpfc_hba *phba, char
*rdobject, uint32_t *datap,
 {
  struct lpfc_mbx_read_object *read_object;
  LPFC_MBOXQ_t *mbox;
- int rc, length, eof, j, byte_cnt = 0;
+ int rc, length, eof, byte_cnt = 0;
  uint32_t shdr_status, shdr_add_status;
  union lpfc_sli4_cfg_shdr *shdr;
  struct lpfc_dmabuf *pcmd;
  u32 rd_object_name[LPFC_MBX_OBJECT_NAME_LEN_DW] = {0};
+ size_t len, j;

  mbox = mempool_alloc(phba->mbox_mem_pool, GFP_KERNEL);
  if (!mbox)
@@ -22283,8 +22284,9 @@ lpfc_read_object(struct lpfc_hba *phba, char
*rdobject, uint32_t *datap,

  memset((void *)read_object->u.request.rd_object_name, 0,
        LPFC_OBJ_NAME_SZ);
- scnprintf((char *)rd_object_name, sizeof(rd_object_name), rdobject);
- for (j = 0; j < strlen(rdobject); j++)
+ len = scnprintf((char *)rd_object_name, sizeof(rd_object_name), "%s",
+ rdobject);
+ for (j = 0; j < DIV_ROUND_UP(len, sizeof(u32)); j++)
  read_object->u.request.rd_object_name[j] =
  cpu_to_le32(rd_object_name[j]);


Tested in the lab and ran it through a different AI scan.  Both clean.

Thanks!

Reviewed-by: Paul Ely <pely@broadcom.com>

--0000000000009cacd80660bb6384
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
iId6lRoDnFAsEvnaOMvg29iSc9gZaFsMAV8NLrmVgatBLqETEHgQ4n1BrE2+pRoymE80Zf+Qe5W6
GF5zYMjxe2smznZoexz/BISo+5QDZaKZKtmoZ3ApyLjKz1G5Q2hUhmZWHvMu/eGSXP59UaUUmelW
ZlVs3E0h345YpaGuBNlquYm35nQ3ehYjm2jqaIh7F7K0+eF5TPjcMLpqnpak12xIx6BCxmFi8Oqu
Gb9+KrrAD+KPgqzjyZZxdVcCAwEAAaOCAdkwggHVMA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8E
AjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3NlY3VyZS5nbG9iYWxz
aWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEFBQcwAYYtaHR0cDov
L29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1UdIAReMFwwCQYHZ4EM
AQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3
dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAyhjBodHRwOi8vY3Js
Lmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwIAYDVR0RBBkwF4EVcGF1bC5l
bHlAYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8GA1UdIwQYMBaAFAApNp5ceroP
ry1QLdugI4UYsKCSMB0GA1UdDgQWBBTc34vK15RY7h33segpWeDeAloTGDANBgkqhkiG9w0BAQsF
AAOCAgEAb0hABkNonbsXXPrDOwB9B9lRtVhdRszakaT0zWubTTtHAV/XTebY1b4caUC2iX9AJvr0
XTJrFAiLtJ6eeP6yQOjD+rBprWauwPUzydJWEftECpX/lbPgZLBSHx22euCSnIm8HNj8o0bMi+Ii
plCW6kU56G1krQY0jrqDJCFgH4Wmp1TrKi36iVTIXyYLDtPOcSXe9hLmeUlQuL4nAoB8EsI45w4a
5Wi/xS7vGQLXzXAQ2SY6Yuseqhh+QcXvzeb0uVB54edC4HFrVX9DtFzHXoyB9s0C29MZm2zpFPNS
DgwnsmTsvpPuLELuuaJvIKnSHHR9FKrmQZbmz/i6KyBt0enmjNk7I7vAKQa8IqZxSrjvR6tYExiq
BP9ZuiXJnuqoPujFE7kphkUjmK76yv8904eZNflTvcEDpthD1boifOzT78iQ3fbuytR8LKx7tzGV
Ga9+dcLBcR/eP85Vmc9NW1frtO3dRd26+DHs1lXX96Em5AAlvBgDw8b1GfyEvfimBkxTIWxR3mBB
jAMkNKrfvV7NxS9AfcFu4fvxuBJc+t2FN1zBc8VyVyn9ZBeJ2DYS9uQ2x00QPXMHqVlAT5fBanmS
n1fgcSTdHEy1fzVZIAtM1XMIWy03bJKNBwUebgxHKHSUCZ7VSMHE4jyERMCqkvTxU6h4JJ7YzRrU
jhXYo8oxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52
LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAyMDIzAgx9OiWw8dVRSIkn
L+YwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIIAZ0sLOMNADxA2+8wr2MblYhH/P
4416EuEoG1JMTuueMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2
MTEyMDIwNTAwNlowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3
DQEBAQUABIIBAFMML3AvJrX12WIgrYCF+M6IxXlWKdyN1O5Mk85QqA59o/d4NEsF9Nclh/O75l82
+dFa6Oc4mseFFEXIL0Xoq3CGN0AUy3GhVI49EQcbtravOoin9sn7Do058u8tNopLHDyB+ZD8KS8C
sLWzVakckN1c6e2mYSN/eKEfWe2xqOywJJbEnKBhjiLG0YnzaeAm+xGD0PgafjRNNilZRnJXYADj
Qz1mGZV19cOepmyrN6LqaVtN1eGWjbH9vc2W57qyqFtrfQRIoCiIFNX4OpiIsA91blkq+pIGqq9p
eH7z10enJb+uhcQUQZBwPbUV+4ZXW9AfUJ/SAZKwnTcmoXg9a08=
--0000000000009cacd80660bb6384--

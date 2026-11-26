Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795712735;
	b=CWz3IYRy/9bRiW1ATzwOM/FaruCgIr84I1J5mr5/XfTdbDH0Jv7oU6LgBQebIoSmyQHT
	 Lo1wSoKN9S2aJuZ45BrxyS7VCSoJIbj1IkDXcIy9IyjVvpsVIYCZrl30MiBlRnx9ocLTg
	 xTjX/5PKUenC6DjVsGtXeCf5mwQepQvoFcncxat9uSvtq/y3jC3uglQCRnSXPUMv3E4LP
	 PgOUGqB/uDEnaU2b6yJfR2pO1zuBex4lMtmnLMGF3fR/YYpBZhoD8z/2vi844bmOSYCcv
	 z32nh0zXyhzzu65K4x7s68ktBLMlxuEPW3wBMlgtV6ptgmMmEC9coQ4EulvcXcEXcLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=XcjJIrD5thD100zFeEcJgE7D0fGNyC94jOzAKJ+Xh0k=;
	b=16meBt51vGxh/80AtDAYObMxuecq/IDS3pwzijgfvm1alU6QUtGLZclc0GJsxx7La82j
	 jki7v0Ksj3A/q2MZ+Ft0tVqcRkRs/CDi33zJNQr7iTAEgALKihTx8PNnxvRWwfhoIBo/5
	 IMHkoIO1HEwSa0jgbOWTopQcIjOzFaHziQ6Xbhd35KTGrCs8sujUTcwL0TfC0PghfY7SM
	 06PLVwsUeEt+RvGu/ZkUJsJjJ6+Nr3w3Mq/uZa5Nfj2bCjHVRYR/MKmqY3pfGbPiu5aKF
	 LGhLNwDS/2vYL0yL2N6e1oBGR8KH6wzW+a2AjUchzfrU1pzdlti3gFvA5XnVWiQaUEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U4sVDaB8;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D4C606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04D4C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U4sVDaB8
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d28f75d62so1184713966b.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795712733; x=1796317533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XcjJIrD5thD100zFeEcJgE7D0fGNyC94jOzAKJ+Xh0k=;
        b=U4sVDaB8DakJLcp7jU3R1vtaVTH6DB2Tlx8iEyxyhKHHzhYywzBqvFrNKxrqgGpu7Z
         b2qBNieX6Fme29yzC7OWBujSQJioe5V2FgKrmPeALw0f8y62Q4Gj9ZZpQRjtm104F6PN
         zJd2zm6kS28Qqz0cVSoMs7ftGsYZ+c56d81oLx7rnNMoar6douDJg+b17j/NTi9XWRD8
         CfZo3ngkSL9uNBr044/uHkAlMvD7L+K4QSDiYlnVTyogn9coO6fMJLWelwAJGAS7d1ap
         jFdmVvAM0hruq4QNpPinC0cEylfrcn1iJZvwE306Rhu3U69q+b2AZ1Bp+xyhdGKWyLfl
         B9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795712733; x=1796317533;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XcjJIrD5thD100zFeEcJgE7D0fGNyC94jOzAKJ+Xh0k=;
        b=yS3ca3xDpxLsC4UPTyPKVV3p2X+iUEauKm5eM6L3znnLs9fmdvI9sVPeAJOEVYW3pO
         i0brzJtoGwqEPqWcPotC+1dSg8gRY5CW3NJUdKk9d1GtXXgcakvQd+/QnyHDFcrSUKQA
         FlHJS9MCLMA+Osp5dxaGf0Orht6R50+RAKeoKgqd+OoaGQ3AeWPJaR1q5P/lqqh29vxv
         J9PYjNB3Wsa9cGEjM9OzD+KSjHtw5ArN9bQMrTBFypai+ruZ7VCJ7GRDz8rWKqiKygRu
         yNN4ZJ0uzsuS4OPjVKGeBgkGvMyj1n9uwvhBhiux6USbAoLMXIdwFwmzbomU3uaROS9V
         ZY8A==
X-Forwarded-Encrypted: i=1; AL+hErG5SSewZqDfTqdODoznZu5UAiMciLmIFUWJ4NR/v7/C7suMRQJG0gxShlryW+gRwu/1xlGVy0Ihuoo5w5w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bkGVjitEXZs9pg6WW/1Llx0IOR+G8QAkF5EZR+ZMpw6FuFMAq
	D1LmSd9Bes11y3+O5WxS8nfLB2bWvzf0h3UjrqNW0YXzttY7vtGajtL5
X-Gm-Gg: AZFdTZd05HWnnIcAJpTGu6mWG+BerJQf4gCVUMTpmdVe7C4dFiQTaJY3W/UxPBs4x36
	Ta6UwiVLMl6seaaLmvLHvct9mg8nPeRaRzGHtfqaPzIfbrkDW1ULcEWNQMRpjfAkj9EJlRz8lSZ
	MxtEGt0Y7plRdk5WjdeBjI2U/Xa0WE9NvI7q+5Kq7hseKs7FWEUOTkrGSqCjkIcD1Wdq2KsESH3
	m/jJwcVji+VY7AFmBeMWgZew2j7htQV9cumPYdvN5vjouWmwwWMv2ucSWisolvTVfWRXs1a+1XE
	89FH1afv1lNXEe1axFmfZZ+iEmh/Ez3W1hKEf2nBGxLfJ7GbLFaFzrASeD8tGqAheOOS1WbLup9
	k8QW926aXb4PvG+l8nwJVrYGoDvBzCkTq1kGsuVjRwE5SrVcesTSYQbTzXdpntcldjRbcHa/g2n
	TsDaC8QehxOSjvwF9iYBI7hU0UxzZW+ykiNpuRknoxxFyW/kHrpqOzLoXCpM3rMXYwOJuIgQUMU
	FKGA5xcVQDf2JfrViurqBG8ld4lmy48dhaFIJX6mQfwzMAlzMNEYAw/hoPEwLTL2PdlKieTi64k
	q7x6joEBlVFvNZwRSFx2nL/DER4be89e
X-Received: by 2002:a17:906:1553:b0:c50:576f:b39e with SMTP id a640c23a62f3a-c513ab0cf13mr1210196166b.26.1795712733274;
        Thu, 26 Nov 2026 09:05:33 -0800 (PST)
Received: from CachyOS ([176.88.122.93])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae9dc7asm781618066b.41.2026.11.26.09.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:05:32 -0800 (PST)
From: =?UTF-8?q?Asaf=20Nuri=20Bertizlio=C4=9Flu?= <asafbertizlioglu@gmail.com>
To: akpm@linux-foundation.org
Cc: linux@roeck-us.net,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	ycistak@gmail.com
Subject: [PATCH RESEND] =?UTF-8?q?mailmap:=20Add=20entry=20for=20Asaf=20Nu?= =?UTF-8?q?ri=20Bertizlio=C4=9Flu?=
Date: Thu, 26 Nov 2026 20:05:01 +0300
Message-ID: <20261126170501.49888-1-asafbertizlioglu@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Map my old address to my new one. The old address appears in
existing Tested-by and Signed-off-by tags; I will use the new
address for all future contributions.

Signed-off-by: Asaf Nuri Bertizlioğlu <asafbertizlioglu@gmail.com>
---
Resending with Andrew in To; the first posting did not include him:
https://lore.kernel.org/linux-hwmon/20261120170257.589197-1-asafbertizlioglu@gmail.com/
The old address is in Cc.

 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 7fb33babc931..e1479571ece8 100644
--- a/.mailmap
+++ b/.mailmap
@@ -126,6 +126,7 @@ Ard Biesheuvel <ardb@kernel.org> <ard.biesheuvel@linaro.org>
 Arnaud Patard <arnaud.patard@rtp-net.org>
 Arnd Bergmann <arnd@arndb.de>
 Arun Kumar Neelakantam <quic_aneela@quicinc.com> <aneela@codeaurora.org>
+Asaf Nuri Bertizlioğlu <asafbertizlioglu@gmail.com> <ycistak@gmail.com>
 Asahi Lina <lina+kernel@asahilina.net> <lina@asahilina.net>
 Ashok Raj Nagarajan <quic_arnagara@quicinc.com> <arnagara@codeaurora.org>
 Ashwin Chaugule <quic_ashwinc@quicinc.com> <ashwinc@codeaurora.org>
-- 
2.56.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194209;
	b=NNpxMENiYPnumA7jUZC7EZd2jvtuiWSFTlP8Zmdnivmf0s/VssAvsbjeaQ+MrbtPGBbJ
	 9KxTAAMYG2SgeAGEgIVMdE/qdPf68HBv9FwFsheeC5wda4zRjqkIB+Uh5Z6+YAZ7Bj64q
	 HYO6P85r+5zOpYFXLm7uMdxV09NH/wyNgsFJbwMMH2CzGpAlCmULpHr4c1QzWBDkhjEj1
	 /vyF3LQdmXa/BnVwFaTjIxBWzRxEyL+hlO7v660OfdUgP0kiwUaSFp4DXu1DIa3b2I5HC
	 9ldt1lvce1xzSZwMuIoygIYLHoFCG/gsuX2qWeqNUy5gMdCN81sro+VfToJJZRPYXtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=xE5e3lf/0eBW9QOeJCPKjitoelTsiff22jlhwj4Nvtc=;
	b=evgAtceWZeGzPtqZDyJTIuTh7bxyOUshkV7vofxIkwwFVu5xpDV5SH21QJVrvBWdBWUi
	 R3JynKHE+5QwAEceVZO184NBqIGWootGV4U4pFHv8CUDZSoyJphOcSaBimgJ1vu9z/Ocw
	 AfCyFpyAHtVbsgmXTsyaSRcCT4mjBwm7QFnzEMx5AUurajgPKeJ/tp4a9CIcIHG4VdOB8
	 AJDy8OHtp7ytZqoWDhQZkwQmTJ1oXRxHD86/DpnWxqBFl6nv8xYO379+CrFYSwM84RwT9
	 /7I6IKR5lxQiHjPJfX7c/Yk25VzfeBujTZ/DV3/yOKEQphHaCokf8A9OplOH+xIVbnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GRPZAR6a;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437DC606A335
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 437DC606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GRPZAR6a
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so197096766b.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795194207; x=1795799007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xE5e3lf/0eBW9QOeJCPKjitoelTsiff22jlhwj4Nvtc=;
        b=GRPZAR6asKEgz2/4xYov7/GHO48tGLVANcFkzK6jgtJJ83GVVcBFCnwDzvg80TCtGb
         /635jhA4wA5qCOzLGiua8TyUcwNvYESv4/f7KlS4RxhlXWJ9sTwxSjoSrgpl+0VthR/9
         n0fiEeLfcrCiY1TXa5muJC9O88k059eiua8HyyA3ZZquw7J+d+urqhleRKzmui4QxVjd
         0z4kD7+3ryKKuKTcs7iIj10nW0lL4RZDSSo4nB42d5TQx3Dw7ydeo29ucOa/MAlfZiW6
         Fv/TTiG4TjRrR5Armvw591Krtlys45Ta0ubSXa0RambmR0E11L1rnUVHwSbzAuRTeXJw
         IFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795194207; x=1795799007;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xE5e3lf/0eBW9QOeJCPKjitoelTsiff22jlhwj4Nvtc=;
        b=eR2Z73+yFS/6qm3rI6et4+DX/6dCz7Ji0vgz2HajivC9VdFFPbbwN5ZQQVsUx2oI/d
         /j4ahJcc/dk84uebfGArWgGD+mtDaa4NfIs2oGoSyr+XnUd0If9Z+Zl16xGFiYKCQt42
         SKsXu0aEMv1ix7GXa7zQuPKhYH9SlLyxmmb2x37q0LcA2i0F+MBEeg/jh3qTHxdP8061
         QZKph1rW0XI933w5KvXI5VsVIF3J4kinReL/dAo8wmZw6NGg1ke8cv3bjcDmMxdoxh1P
         3NUHrZJVKxRUq1PkZts2BWWewIHfYblvlITYPiCQdlUgeEjfB1/EUmP5sfXORk7d8jWy
         isFg==
X-Forwarded-Encrypted: i=1; AL+hErF6dr7bS60HmDdIEA/w1Cb7RZXSNHsCT81UBj52IxmDIxrMkr+pV97Gb2bng78377tbcpFPbzSf8A9RySE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0OL9OcmCUgekmz6uonlK/gJMtmCQ7cCoVl8M/DwAVDg3XWGVq
	He1YF1PpirSuziwZSQt0jOzqxYfc8Wr9C5nhwJW9UlPU9EObxOd7KfA2
X-Gm-Gg: AZFdTZf8GYjiU7sKowSUCgjMTs69cy4omjGqpvocUcm620ioRQntAKT3HEngY+EuDFd
	ZBpcYiwFVgLizUVGcczjpuCfzuKdes3JI/kbR6SCXWdAhgdZslpk35rfLagbwtS+PSHqgs7L4I9
	NxIah/mqRGCTgmhMQU8TwXxXlZJ78AAXsC3j1Rn2K+ZoflTunkaDlAoySAsuEd6p75WVmrS1bwZ
	KnOe/YNO8xpFygT/c6hTjyV+M7fYg2SU/mHXlyJrZrza33SupoCF7JEoOilIcKvxHwvSp79M0om
	Jtsk+xyfKcOs0oxw4eAmq37DYb/uWw9Cu2M7Z89KEYUJgWqmK10YUV9O/1gfFntO7Q7L41W9NjY
	cs+4QFTm3weDbCLAn1rDHMmfT+rcFnohE8v8hKmPzuN/eha74Ri6Pdkfad3WgG3mrSUZsiFWTVD
	pgWzr41AKfnSEHqllKyKqqJjFcdKqO77G6iOiolgVMIYOlMdjKrxDwHmC8lislgVLtBFEPAm1kL
	MkQa8QN4RGOVClLZlsMPf8Tf1JywR/3EQRN8oEi4NO0ivJYGIlsMSf8eUgwSlA8SqFk+lZLXgjZ
	a1lwg/4LgkBK4A+1wUlWXAu4C4Itc7zlT4I=
X-Received: by 2002:a17:907:b02d:b0:c34:1ed:54d9 with SMTP id a640c23a62f3a-c513a52b544mr304697366b.4.1795194206635;
        Fri, 20 Nov 2026 09:03:26 -0800 (PST)
Received: from CachyOS ([176.88.126.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc73d3sm114753366b.64.2026.11.20.09.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:03:26 -0800 (PST)
From: =?UTF-8?q?Asaf=20Nuri=20Bertizlio=C4=9Flu?= <asafbertizlioglu@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Asaf=20Nuri=20Bertizlio=C4=9Flu?= <asafbertizlioglu@gmail.com>
Subject: [PATCH] =?UTF-8?q?mailmap:=20Add=20entry=20for=20Asaf=20Nuri=20Be?= =?UTF-8?q?rtizlio=C4=9Flu?=
Date: Fri, 20 Nov 2026 20:02:55 +0300
Message-ID: <20261120170257.589197-1-asafbertizlioglu@gmail.com>
X-Mailer: git-send-email 2.56.0
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
Guenter, all my contributions go through hwmon, so feel free to take this one too.

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
2.56.0


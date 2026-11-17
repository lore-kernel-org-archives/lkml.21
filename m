Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939215;
	b=Gi2lHmAyBqcWOKaowI2lvy9+/wATN5tm5CB3p/CaSaDqK1i/CTZTdN3xrSLJfLngGcFY
	 1g/wMvg4SwlC9O8oKJLqzkW87vQH6kCbIcMV7XPV5YTQqp4iPLSELJO6xkxcu2jOunLPc
	 jFRN0O2uV3kiClb5sqxmn1htq43UF4HtVzWEmNBNr0iMYB4jf8BAEJL/0OOQsl/uW25m9
	 L9yGqEh1JMavXnFGTOjnbrbdyVXCM6oFz++lyVwkr9WZM60KehxlpcDaArdZBdrEjh+wb
	 pfCtjOXSB85ZqCEHgPqbfgdDmqkBIqnLBRNI4C7PO50xhkzeRWMQLkVp8z69jP8fkfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=meL0+rTQnSRPz7Yn2GzsMx3xxjISuzA0apMMf/0RgbQ=;
	b=pm0AztIeJ09+OT40vtkipBnHbbBuG4Xt9Tajf03jfCz8A+gQYa/6qalHVEDgWdr6tgGV
	 qA9zQWqa3AjyK7uPEtTEmedDE4ukZvqc/ppwdlKVPINRwUNZXKE994PiDHrWwpV/crO5v
	 COjqBtNqWMQED/8uGoRuEtg+w/PuuC9rrC4j50nGKFbb1xMQoBV8MwCZs/IfSOhvFfp1r
	 SvOL9CVJRxJwWsXfFpzUvpI/wpyIuLUVJQR5rIEjT30DjBFLcHAlEffpffD450vbjmpt1
	 rM5sBe0yosZnLBuQ5G6mQ3rjF2Lx5vqiadw2vgCzIEGxzNYt3AV+M30DxB0GCGB0JyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Rqr/hizJ";
	arc=none smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5CD606A89B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A5CD606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rqr/hizJ
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67c6a0abc2eso5587455d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939214; x=1795544014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=meL0+rTQnSRPz7Yn2GzsMx3xxjISuzA0apMMf/0RgbQ=;
        b=Rqr/hizJwM04N5r7rdBlI1SrpCZm1YU2VwykcRD4dToC01j8O0eiPOi8Zfdo+cSsEe
         KepkZt+HzaSliry7cfleqlm+vsu4kjci8eNfqf8ZW3D7n2FU6NT5ga6OyRwovGfvl7u3
         moafL7fNIaKLFfV5rLTysxDKefHgo2Ste3Vh64H4ghp2hsu/BLV6Pa4fKa+pUfA0nXT5
         POTyodqTZK1gOQDkzhdPVkul/bv3zKZlZuhLJIo88VWu96PktIZfaiYanN37OPuObyx9
         vgeQG5E4qagJYZGOTrtTjO4v+BZSFK2wUK8eHyxLKXvbbb1hzVoVMMYRSQdGAcRYgpct
         78wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939214; x=1795544014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=meL0+rTQnSRPz7Yn2GzsMx3xxjISuzA0apMMf/0RgbQ=;
        b=oTKIsHobz/Cv0X88vw7jXbU1NXohXl0WaX5qVOE4tixTP2Fxskqnt/nxXTdjy2o9us
         4p52O498hsqNfRf2JmR+W15WyavtqkOxpkmQ8vOkxJAMoBnIDVx9p80fCULQvejqwfnV
         cHEM4cLdOVsxvWgpaHdoZVaPy28Fl4BcbWyk9yRxlr3OlGwymyDkT4ViuVfOKEH/nLwb
         2W/TDhHS6dE//O03i1ezeyQB1MiwwaWaXixdAvYrtcCd4JmxWcJhE899gQOUncIYphEg
         q2DB6UvgTgDv+yjFCHi3sN1UmM3hsLCU0P4EC5Fk7gattnVnm+nEwVYuj6H8tAeMvGAT
         BABA==
X-Forwarded-Encrypted: i=1; AL+hErEnr7FjWW4j9AUTaCm16JR1ikgqMy8H6tOGnMbymAdtKash+nLWbrO9Md54dpMEKtucZ2VkbzJP26koewo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EcR9vT9pJpqqt7GbXLGKqbsDYOeIjcCzMUyDvQNmfTSSLZ9ay
	GFH+92Ni8/iIHFdkRyEt9S+AFGxZHf2AMLcxNwBlc6LsurrKvErFQOAwzue2M06BLpU=
X-Gm-Gg: AZFdTZcJHz9Q2fFoiNTT7hZg3rHJSJtdk5ngYVbTALDl4q62t7JviiGQrCvmCBj+VDC
	KT8MopcH/4g+OSCXMb9y+Atbf35BdCvvlTuEDOlu7FIM1VkJWoYHiBV9Vhxe4eCTbzBQJJHY0MD
	lgVZq3rrne/VLlDjdKvXYwAZ3kCdsapGpNCXFP5hWIek/LtLOr8V1LLT/FbETwDfti7zHKqypt9
	c/ryX9KW5NJHnOw9q5Zuv9vU58a1u35TMjDyFx1qeifqPwl2K6GSyXZOMdGUoABr1wse0wvHOOU
	MRzoYPZpk7LkNqrvgBvpB8YTk5tj01WJNJIhiOb4IWVrlda3Mt8TfzbytEVTol6teg7jfImbPJm
	AUTSIhzr5HjU7rQTxX8hNj10HK0WWu9FR9gapSdxfn7J5KBZvU7rilyv99RMHJx5KOurIK94x8p
	fvIZvuR4ftJcMsoZOUJnRSOBHQAfYCmJi53RYaNpL+JIe5xkokY0++3eLhhJ7R7LsfAl9/iYjlv
	tbRQL+65Ay9msaA8f9ERI8XgmeTFF/8iw3ixaokWZWf9xd0b0Zdru2wlKsQXQa9gUSfGKf8edeQ
	jE0Tk7twc9roTqp47OwuhjRMGa7dwdYTMns5ckPPGM2dquew6C29FZR80z5aYHkFR5gCZzCmglb
	iq83hpCdP82IdIErHY6cRjNAiyZLeLTSGw04EpdryLF2CKJoh8mWNGYKJV4Yr8UvbzrKCniSumi
	qAGuo0g4Jhi1IAVY8+Ng==
X-Received: by 2002:a05:690c:6884:b0:8b4:e4ec:ce6d with SMTP id 00721157ae682-8b4fed78f0amr379807b3.73.1794939214002;
        Tue, 17 Nov 2026 10:13:34 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dd3fed5e0sm269767d50.5.2026.11.17.10.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:13:33 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 17 Nov 2026 13:13:29 -0500
Subject: [PATCH v3 2/7] alpha: marvel: report environmental events without
 VERBOSE_MCHECK
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-marvel-env-v3-2-0edc370fdca9@gmail.com>
References: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
In-Reply-To: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1534; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=oaDjaxtiZhTza/9Q+dIadPybMp9H7XVMHIR6nixhj7k=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+zPS4do6tJej8Qo3K4pUai1r64iQ/OB6bvq06wFnh9
 enzUVa3Oj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaac5KMDEvyCxZoVf
 DXn7AILdtx97zkt38x8yqdFjlJ/23XMjfpfcrIsP7flWshMtsm+FV29HNHPRM5XzcvbOWcLY5i+
 nZVP89d4gMA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The service processors report temperature, fan, voltage and power supply
alarms as system event (0x680) logout frames. The frame is already
classified as reportable, but without CONFIG_VERBOSE_MCHECK only the
header line reaches the log, which does not say which sensor or what
happened. Print the subpackets unconditionally.

Signed-off-by: Matt Turner <mattst88@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/err_marvel.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marvel.c
index 9304ae74877d..46c521cea9a0 100644
--- a/arch/alpha/kernel/err_marvel.c
+++ b/arch/alpha/kernel/err_marvel.c
@@ -21,7 +21,6 @@
 #include "err_impl.h"
 #include "proto.h"
 
-#ifdef CONFIG_VERBOSE_MCHECK
 static const char *
 marvel_env_state(u16 state)
 {
@@ -34,12 +33,10 @@ marvel_env_state(u16 state)
 	default:			return "unrecognized";
 	}
 }
-#endif /* CONFIG_VERBOSE_MCHECK */
 
 static void
 marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 {
-#ifdef CONFIG_VERBOSE_MCHECK
 	struct ev7_pal_environmental_subpacket *env;
 	struct { int type; char *name; } ev_packets[] = {
 		{ EL_TYPE__PAL__ENV__AMBIENT_TEMPERATURE,
@@ -70,7 +67,6 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 		       marvel_env_state(env->state), env->cabinet,
 		       env->drawer, env->pe, env->sensor, env->state);
 	}
-#endif /* CONFIG_VERBOSE_MCHECK */
 }
 
 static int

-- 
2.56.1


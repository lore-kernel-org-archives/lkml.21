Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795046994;
	b=nOiN+d3gEfQ0BnTunxWG9ZI86nr48uLk9W7EEay0tBjuodLQFovu4bqmJI9Ynk5gIbMi
	 jl9GTSD6SGNeuwP9V+GynkXxDqy7OP25IFAmRdaHo9vUHP5MG8zNu+eyLEsLITl9T3Ilh
	 WAjjr2fuasloVu6u2w/ZLeyJiUCmdiV8GA4Xp5CCgHGSxpJ6DD8GGof43HluV1P/Bt03j
	 PDqndEZpdOMQsPeCGvKZ3g6OwG2Fjq1o/immeaoGIvNTxNr7uY7LQHBKA4n5NZJcX1RtO
	 J/YErP3Crawb85EK8lKunnJHWxrdNAdprpWDMuuX+SHUvCX0l7bStOCzoBuo01mY1FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=meL0+rTQnSRPz7Yn2GzsMx3xxjISuzA0apMMf/0RgbQ=;
	b=FuaO6m6/4WjuSc2oT3aqP0BpPexvzZLqAt8Web5eAjTvJ9aUZqVADkcH9MB/FYyuoCsm
	 Ln+z4ZMZ+eF/+SmGt/Of1jcch273SdGy+zPqpmHqO3hSiiuT3wHNnp+kU8mmCTw2AGOIz
	 yFLnuqndG/Kzfd5KEEQU5/McU8iYgU/GkbG/muPlSfmAiUoMllFQgZXpGzbVVTX9rq8dF
	 FmHY9G4Sxv+rt+MsYFmbiDjRSQr6LTEr9gvuJYQlF20u2YkHjm3TeQX1njVMSLi4omtzc
	 Yp+Zg1/QpaOP3CzFgE6g1Qd+Nd32Iykow/1Pb95uf+A8xCnCeONXCELRoCSHq14iPPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EhtTpJ76;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DD7606A336
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12DD7606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EhtTpJ76
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b4cd576f2aso14447437b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795046993; x=1795651793; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=meL0+rTQnSRPz7Yn2GzsMx3xxjISuzA0apMMf/0RgbQ=;
        b=EhtTpJ76+FnPhG+PiTg1598hHMEeBs8dAYpnflx5oDdjN3405Qwl+4BF8HE7knr+Gw
         4fpmK3qFzpggPK/eifxkZaQ8Nkp4DYQBHOYz0/moedP/klluSBnwanY/otpG8U9L1TZ8
         xMpCvCylHLgiTv9cLZHw/CYT+0wytXHaxK50M3U5CUy3U8XoNmhkJM+tCXrBHcFyEhqp
         dumcD2MgkYrpiBT6ndb54Mr/qJJGj/vzeCLjGfKyudL2OJb6ErGELWyq5OTsWWdEBrtt
         jLaaF8hkXD4kq7wquuECY3gcerl7J+3KB1MMpEn2SbRpYJSc+AL+OoyQMqxvkJVi+jN3
         IHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795046993; x=1795651793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=meL0+rTQnSRPz7Yn2GzsMx3xxjISuzA0apMMf/0RgbQ=;
        b=G6Ilr4RRQCHv94XaxfqVYRpebxYe4lkJOjAwg8ndLt6rq2tlm9jmv5rquKRQ7HSxC4
         BOggAMDyKn0xpgsWknY7eNLodE0VjePDul/Vp8cmLevMqb+8xS9NlaIsIfjwJjnXHNQb
         uGFQuzr3xoEDKhzPTwNed/ErVreSLAGtXbv3adIKm0aoxlbI+5rbtr4Fc/Tj0cWxhHGR
         Fc7YdG/DMHX7/LNoU3lwol+VtHO4/1uD+gyEjTOyy77anvhhbHcZwHp0HjfWUF4+OfD6
         OjfPUoLUO2KlTc8w4ILkDBdQkExSC+Gq13e9OPnMFHhT84M/Pa5nTU68VYN8jl29zD21
         zFwQ==
X-Forwarded-Encrypted: i=1; AL+hErHRLlwq4Aes1Ypa2Op9od/MOb95UCF6wie93HTLtsnzy5SZH2rO4AlIl7iJ0EHq+QcsfWOCyoXaKfBAWqc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AAzgOmzT2jb/D55ewFNDddia4C8ez1HYjAEWroPDDGe7bUhBz
	ntP43Faz5y+ok6TuTd64kZLRj3p0nDYfjgFfSIfMDaECFct4QjbEA2mf
X-Gm-Gg: AZFdTZdPfEBJBRDlPeFcGYWnyadIIjqCkzcp/loyonYcBig0oJAxaFwh199p+UlGZYq
	XuTvK5KR/sSb/IYYCG/Zzwf56cwMNIqohNLS2e6GbMairNHTNMKMBRGoObGh8n1UU8p2TPO/qCO
	vxb5IgktmWY8BK4U1lvBuAWy7cghXl2EV+2ekkdOPyYaIQmIkz+GhsxgBk1SzRJnp3lwwAq0mqt
	/hfFVK2olIigifBzqLxlziBMCpVE0LmZ7ZgJG3xOu0bgnmF43bNeHlw4w12bsFjQ0Le2gDssS50
	vDzcP31AqFjfO2dT2jicbHj+vi+8I1nBRI9xsBhEhJlsNu1IZldSnotwjCmVtAQLlQET83wmiPv
	ZoVfYUihvu1v4XkQ5iiRfTbs8u7sgBee6Xq2UgG8DmOJH+UVbIflNMkE9D0AnhStRc5/Mic0lND
	mbzZROUZBYywlk3yE4uhdBBCxVpzSLqhZKaLjLO8OElbGLwnDdIxjGdqmHg8TfCDEHCtaOprmLT
	5WyMtI5rPLUELGw+8B0i4jIPA6OZz2aWxu4wvlTfJwiIZkI6A1TCv7nBT2ftQDyOkXu7BrTW0MB
	viB04+SMovlaavUfusWcvMd6AQzggVGcjqbZU6oC648jV+ptHpFKVENaYdqpKuxFYbiS2iaGew4
	Ov5QZYesXcKmZ4E6fucrRSJdecbW7g0r3e7iuBMVVUh8NzuDc0pDoCJjWrCu1U6wh7tlTc6iKLv
	RKymAr5EQ28amRkOIVwQ==
X-Received: by 2002:a05:690c:446:b0:8b0:e238:271b with SMTP id 00721157ae682-8b4febd9edemr19519507b3.2.1795046992979;
        Wed, 18 Nov 2026 16:09:52 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe03091esm26035277b3.12.2026.11.18.16.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:09:51 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 18 Nov 2026 19:09:47 -0500
Subject: [PATCH v4 2/7] alpha: marvel: report environmental events without
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
Message-Id: <20261118-marvel-env-v4-2-200317e496c2@gmail.com>
References: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
In-Reply-To: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1534; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=oaDjaxtiZhTza/9Q+dIadPybMp9H7XVMHIR6nixhj7k=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+2XklqMwT/PPvSl/C974Mp0mfRe3/KXuU163X3rMxs
 qvpdvGcjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLlmNTsjw+kNJuUfey
 XaX0k+rDLh5fnh6md/bdsfpxUl79uqVrHN72VkeJj9oNnukvqD5x371YVYpbdfNUub08OVFPalM
 /TOk20bWQE=
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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939213;
	b=z3kGhDqDbzZ+WQPFiK+Q/cRW+TtL5goLeE4r56oOYFEsd++Ca5VjwHzBsjV9j2738F7s
	 3U/uc1Pfo8VynTgcOWiRsISr9XWt9EJ18S3oslIRbfasOYbBskurCbIHK0yeA65HvX6kQ
	 kbyJq77oLgmrh/K3oHyD7LJxQyXIrc6MvZvfGrf7ugrnFN6QP3VaQa+EgTMPbVNdSjfPK
	 LIgfD5XlNYpxSxX3VqU1OmB+xfN+Lz2B+Jo46l/ta3KIgMlBdM0kb3JnphARNtePYaWbV
	 VmYqrMG9VK/PwHXS+9mwrABWY2ZxSwU8LQ6opWxma1hRYMIe/8UisqRblKq9/RNEIpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=STiFEihDPW2sKfJimv5gbHnLP49I+Hzh07ArF0xI4yU=;
	b=JKd6M9TjXr4aqL4PdhS0BlA3B6d2XbBc3cGzf1uSowqvmgr4DIlCdfBGfJ7ILZ4lvZNP
	 XSSTku+i46SF5EfOfggJ32nu5Tl4/uhIQz9Hf3ldOXN29oHsBX0kBE6m33FUMuZuanVZO
	 md/AqSx1FIpPiNnjCw1FhWlevY7vvmshSvS8EYlY+xdv+xzGvv2kYclKhzKQts01L9AD2
	 RuTFDkQ1zOEtzh6HIB4QL9g1E5Ig8XmMCshQLyQYCWnHKcAR5ZLjNSNJeYJsOapc7WHVW
	 /0DSwmh/QoIkPPYGcsY9tEUYwoCq9Iiih9YTpnWrdIW/k6SsNgJ6BT20850eBJ6wTtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DelVo3Fu;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B315606A33E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B315606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DelVo3Fu
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b4fb5d96b3so8224457b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939212; x=1795544012; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=STiFEihDPW2sKfJimv5gbHnLP49I+Hzh07ArF0xI4yU=;
        b=DelVo3FuA+QfaL/XLitEf3BPpzMVALmV/qxtrP+9gsFgUKO86iq6UTpET93XzHbNg2
         N8OWzHTmC4W0rvZc9D+1kp1jMpB1PQgymdOaN1u0Ej2WUCVDvNotVKQGowoNmBE2yN4H
         d2BcSpn2gGMzHYLEdUtZ9Pv2j7NTWn04lqm8gBxGDNPjcAHDLvO5HInmsAiiVxwGDWyt
         ElXPE4XMywan6YS7Hi+MErci2nI1vlgYoi6ADjD2fC1fIGJ7e9ydeqgkbMpkMUkOGL+7
         QNLrGp00LiUMkcXJ+c97/XnNsEtueT37z1Y7EQVeDZE+0lJWoOEuJM/kE0ob4N7R0Dwu
         cqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939212; x=1795544012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STiFEihDPW2sKfJimv5gbHnLP49I+Hzh07ArF0xI4yU=;
        b=YN0MUjG2rkOG7fSS2gtDjQtB55RaTe+yWEf6T3iqtVi5OgJRWDYkNvO3L32rdjCWwM
         pEYsYIceGD66Ct6SSsTdbiJ8uY+5NWe5QnROgNUfb214Cvw1Yy70xuSy+SOlnlsTAVKA
         FW2UJlTZykMODjW8zFFfdSYEqohLFjiubo+83VPPP7y09Y74EvI+3JmBd8EN5ahr6gth
         dhUW6d371z25+NqVBTvqa5rADga/wIPGxUvG7J79TcAl6Vd+xNjo2GI2npTAREvJTdOq
         JdlSHPqsSQUG60irwdACYb9Zfebjzg1ZlMy3Y5t0+ha5CuZGZq7mDbmbEi0mXT8iPQ6v
         T7iQ==
X-Forwarded-Encrypted: i=1; AL+hErHevOTT8MkQ9KBtjk2YQ2CDQw0+Gurw/X1YceVVy5QtU7A1oQ3oTwHnLUMAhfECujLayXgnQq4GokEHVRY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kun77T1/Qe14lECdzh3XP8LtWcwi8tFa+jFXRha3VJsiw09MF
	Nx4i7wMRhwCQ3JiAS4ROAEjY32LKg7zXZ9zN/raFwRnZXQjQdUE9c9IU
X-Gm-Gg: AZFdTZcUkCGBkQ/QVKEyZJm/jg/ytUgYgO6HTnBzXY/LJSMXd71SAaetMjfFuXTihV7
	3DMB7PAOdnW1OchavD9MczG48KWe1o3+lvqCldV3cuAkLCoQMsL2Afzbf1SoxeZPCLdu5i+rCd7
	xHbIE45h479cvC2UfSnGiOnuq6/r6q6Mw7RqEsgHPRspivbVq/u41YzrHbUSmd2OGgKoVtkOfr3
	vzXL4FRlg3Wa8mvknSY9IoFlFEA3b2wV7+5XyvXnsxa8KHhw6se0j4VyTRyRv50F1NwCqpCpurr
	1/cbhCXD+5/jtu2/elcH8LGPT92cNJQVra4MPQc04sFA6PMJ8GH5ty4C36XAzwfqe4t3HRW8PBV
	a4U3zrjkt0TW8UWyJmVVNKnvVjmRZjAHhpuppH6Vti7OLiI0mShe25OuwjU/CKsJnuNpVn8XS5S
	VNp/oa5QNwpuH+iqpFIuMmomxapNBUBh0RTpJP7iIwwlr7djgzbIIZNTRLE+6lzFrNVN5Mbk12K
	Ci3uO/mf1DiJDIVwWHJbMW1ysjchPsfA5hopE0ZNsZLJEUIgxlHzaAsMsSTVnEeD6qiVfioPj55
	SYcZCbnjQDI5LpAkJ9livEzPARzlSDmlAeIKfbynZ6axRir1WcXUQjFvLgPD5WZwhNtJwjsqb+H
	/Nwos4//UXWEMNy+9ARPZQ+DRL/H+l0NzHSxStOK9+GR5AN39HMh2Zf27Bwu1qrUXeHKmasAV9c
	E0SE3bRiGPDYdjNGiRO7G8UWLlrdlR120OyGhZb7c=
X-Received: by 2002:a05:690c:60c3:b0:8b3:4dd:5fb5 with SMTP id 00721157ae682-8b4ee348741mr19729657b3.27.1794939212219;
        Tue, 17 Nov 2026 10:13:32 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe03097bsm2800817b3.7.2026.11.17.10.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:13:31 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 17 Nov 2026 13:13:28 -0500
Subject: [PATCH v3 1/7] alpha: marvel: fix the environmental subpacket
 layout
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
Message-Id: <20261117-marvel-env-v3-1-0edc370fdca9@gmail.com>
References: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
In-Reply-To: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3358; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=qw1DEcLCwtEfM12rcDqEVnYxZDGqgYJLaZJKpeMvQrc=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+zPTg3bWfrd3qY8Xbif5P9XZVBCvFPjP5xeD1xie+M
 IJbaKpmx0cWBjEuhpliiixx6xVZZrXtWOpzWvoXzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 CGToGMVD5PQYNDKLi0tTi3TTCooc8vJLEksy8/OK9fILUvMK0gv00jLTSjIy8ouKU4FG6OWllpi
 6OroZGRqYWDpamDlZOJqaODs7GTq5OTo6uzoZWZqbGDhbOpq4WpozcHEKwFzjq8LwT18rUTQF6K
 xv9fet5q7ykoySi/ia7f3S5vd10ez3L35qMPxTc/p2Y+6z9x94vhivc3dccCNLIUlat6o5dQXPz
 IVvvjgzAQA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

struct ev7_pal_environmental_subpacket does not match what the MBM and
CMM firmware (V2.7) put in system event frames, which is:

  +0   cabinet
  +2   drawer
  +8   PE (the power and environment node holding the sensor)
  +10  sensor index
  +14  state: 0 ok, 1 warning, 2 fault, 0xfffe unknown, 0xffff removed

So the byte printed as "Condition" was half of the sensor index, and the
state was never printed. Use the firmware's layout and print the state
along with the sensor's key. This matches the frames in the error log of
an ES47.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/err_ev7.h | 16 ++++++++++++----
 arch/alpha/kernel/err_marvel.c   | 30 +++++++++++++++++++-----------
 2 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/arch/alpha/include/asm/err_ev7.h b/arch/alpha/include/asm/err_ev7.h
index ab17e6333764..5d30af0221fb 100644
--- a/arch/alpha/include/asm/err_ev7.h
+++ b/arch/alpha/include/asm/err_ev7.h
@@ -147,17 +147,25 @@ struct ev7_pal_io_subpacket {
  *	   class PAL (14), type POWER_SUPPLY (14)
  *	   class PAL (14), type LAN (15)
  *	   class PAL (14), type HOT_PLUG (16)
+ *
+ * Cabinet, drawer, PE and sensor are the keys of the sensor's GCT packet.
  */
 struct ev7_pal_environmental_subpacket {
 	u16 cabinet;
 	u16 drawer;
 	u16 reserved1[2];
-	u8 module_type;
-	u8 unit_id;		/* unit reporting condition */
-	u8 reserved2;
-	u8 condition;		/* condition reported       */
+	u16 pe;
+	u16 sensor;
+	u16 reserved2;
+	u16 state;		/* EV7_ENV_STATE_* */
 };
 
+#define EV7_ENV_STATE_OK	0
+#define EV7_ENV_STATE_WARNING	1
+#define EV7_ENV_STATE_FAULT	2
+#define EV7_ENV_STATE_UNKNOWN	0xfffe
+#define EV7_ENV_STATE_REMOVED	0xffff
+
 /*
  * Convert environmental type to index
  */
diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marvel.c
index c0c0ccefc467..9304ae74877d 100644
--- a/arch/alpha/kernel/err_marvel.c
+++ b/arch/alpha/kernel/err_marvel.c
@@ -21,6 +21,21 @@
 #include "err_impl.h"
 #include "proto.h"
 
+#ifdef CONFIG_VERBOSE_MCHECK
+static const char *
+marvel_env_state(u16 state)
+{
+	switch (state) {
+	case EV7_ENV_STATE_OK:		return "ok";
+	case EV7_ENV_STATE_WARNING:	return "warning";
+	case EV7_ENV_STATE_FAULT:	return "fault";
+	case EV7_ENV_STATE_UNKNOWN:	return "unknown";
+	case EV7_ENV_STATE_REMOVED:	return "removed";
+	default:			return "unrecognized";
+	}
+}
+#endif /* CONFIG_VERBOSE_MCHECK */
+
 static void
 marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 {
@@ -50,17 +65,10 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 		if (!env)
 			continue;
 
-		printk("%s**%s event (cabinet %d, drawer %d)\n",
-		       err_print_prefix,
-		       ev_packets[i].name,
-		       env->cabinet,
-		       env->drawer);
-		printk("%s   Module Type: 0x%x - Unit ID 0x%x - "
-		       "Condition 0x%x\n",
-		       err_print_prefix,
-		       env->module_type,
-		       env->unit_id,
-		       env->condition);
+		printk("%s**%s %s (cabinet %u, drawer %u, PE %u, sensor %u, state %#x)\n",
+		       err_print_prefix, ev_packets[i].name,
+		       marvel_env_state(env->state), env->cabinet,
+		       env->drawer, env->pe, env->sensor, env->state);
 	}
 #endif /* CONFIG_VERBOSE_MCHECK */
 }

-- 
2.56.1


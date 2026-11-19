Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795046991;
	b=vxTH6Bv8OFOPjb/S4zrcjwLd3R5OxFIxawria24WmSy+EJW7l4cGKRhMQ87xelpZaUVy
	 4IijiL8ET5qEQcR0EYEc27s326Rk87JQH+b9qyETiVeR085Gnx61xEYsBwElfhOxCjf+9
	 OMgL8eK/VX/u5eR6qzZNkLsus9LKmqbjF1AU9dyfQlQh3v7slXlB9Z60emZX31G/5+eAS
	 AKy7FXz029kcX1AdhsTIX+Ix2X75/4qcCIp+bRALma30yilpn3mUQyc/4CcvCRmuozRAF
	 6kTFI7TO9ZiiPlWLfG2hDgxqJiP4cfCsccI12R/epQda3Eq+t6Udjnq2MoGsAaakbRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=BLPr2V+6P1cgyjq9tEYgPW0BrtnD8fux3EBJ1CeFpho=;
	b=ZO2u3vyH9Vk/D5X9fZc3C0lsBJ7+SdeE/s5YIhRXj9fPJhKGrXPFoP5fS2bZdeB1KXk3
	 JIhHa4Ms2Ylsmb138EhELCCBsUmmdz6YLxbxuT9hkCtnCEcSkfHgHStqKYmGQusTXG9Pb
	 Zxh2QrkKUSl7kwA+/Pjrpx6k/z2LmIC8EMU82YnRM6ujv73erY4SH86WSKq+ftWWK7tVX
	 k8gHvyv4HPLRozY9GxJ5KcDd3bBzFhyTVYHT2P8FUkDJJjJXUDZpwdJww7PvyRYTsjTIW
	 LO2bJCefNJfOHp/9ghRYxR3XLsK4VWaUPsiPUcRzU//jktKDPKH5TyQ2qf2cjnpkOpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uGoKxSaH;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1691A606A337
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1691A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uGoKxSaH
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67dae7d3f7dso1930267d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795046990; x=1795651790; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BLPr2V+6P1cgyjq9tEYgPW0BrtnD8fux3EBJ1CeFpho=;
        b=uGoKxSaH3y4gXNtIiczsKy6HTq2nDiXYwDcnV1fEoypwq+KRC0N0raigV6+l8adxyQ
         9cPkpNV5SSAWgQOT7JMbgBXIWqoX4qL7qDDGPv1sssvEgIG8z0Jx5P7lDLZiHbGg5knh
         /+f2DSL2HabRj6entLgqGfQDZLS8Tn6V4OcygMR7TciHgA245eJaLvxeWB+ktP3saEUF
         AwhqoLxLgt8JiLGBnSTL6zNFBRM/kx55SU1uLjdHttYGjNX6ROFayf0nmMnvwVN+w4mA
         8u9a/zfqIDCKG7EfHTzll9d6r4FkkJKxDbIoRWs0SvCklmRL2GJrdT0fMs0hll+D/gr8
         g70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795046990; x=1795651790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BLPr2V+6P1cgyjq9tEYgPW0BrtnD8fux3EBJ1CeFpho=;
        b=1hFx2ldFbE4UaYhYTgBCvNSSUb0/Dm+2iP334RHurtp7aM4ZugA2UP0G+7unx6Xx4C
         gNxv1KJgQEfqFGVbGtzBDnU4SHN8n5ACD5/z3ykweoKv6ftSAANcZzmuI7RTKrweRYQR
         pbmiSJbQ9QtNG5EwxBER/evHGA8nwyE+vEIp1X3LERNdo40heAP1SW/Ht/tXCRDs0Sds
         6vKna/zZZ3VVvTmh2AyOJ9Ew+nUTTK6HLpG1NtYNeXjApGIf1ho7ZDnyiCQp0FR7XmIz
         qkK/CuUwAcc79srFLxaFuOI8+dcFz8r9Lm7uURaDhN840oxk5sbtHGC7hZRpTtWbj9dZ
         24GA==
X-Forwarded-Encrypted: i=1; AL+hErHvPOUu9imy9jexQtd53TMGS4equlUu83SNnRURnylyRcOpz4bkkg491W8B6ipFQstBQMhwbT/VdgBSXbY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wE3mDZfY/jiiWVEvOYCmudf7N63SkqI/G4yOBaDbuqp90Mfi3
	nAbRRhlfYNYYFL/VVLL52L3qSGWvK13Jm/f06TYGeFpk6e4Xw3C9U+Ra
X-Gm-Gg: AZFdTZchiyAKXWj+60z53Qv7zsZSp3xj5Xs8kJkBdcK7FIgHau0bqhVTtBZRAwho/jk
	KQ4aDBUENroLpZudw6R5saAnetgvCwlysw9JitqxScpGojq50NIiMYM+xsww5fnexulvWMrqWhx
	FhLEWWqNNfm0MMROZKf4tLe82MJcOFBFdGU7RMxm0CWGD10BNxHLoaEHelVnFGaVupCIB2VNpsg
	/9qjgd9JAvj5KYOZ1El4SGTQR/FjuzBAgi2VB/KvPs2X4WuLEbu/0KAKIV6Cq09XpTQPfQAliXG
	B7xHdjPgSMGR4nNUmtm1eRQ0fy0hdXm4IUycw1RYeJRN32UW5K7U1AZIfn3CNxG3e+9LDTcXXuO
	u4SrEg6dMz8UOt2lBa6lr5wPLJ5TUCZjp5u313gbCW6hCucWhg64kx6yTEEuTcmvBBmhyRLu/iV
	TfbEtYqhKlSlWa6MttuYbc+BMiC4yDPQ/Sdr6YDVs8QOxJidkt1w+RFhdDZBkCt/YQ6S52I9+30
	WIuAX6hDkUvHffduaD222wwJCjO6MbsufHn9csUTfAbEisOi6MG+Vw0xYSRZsyMiek7QhHcvHjH
	xXVCSqwOHTyZ0bIJ+LjRO0KQfKsDwMfQMUlwbcM3GhoJVEuD/lbpbM6BT2KacGrWmt67aweT7FR
	4VVVpyRDDenAhqErzWNQWqp4+Lv2bAFP5rvC/O+8sLWWsfnYEV0uGUtVNN8oBNhmhpMvk6cYIHY
	F1hSN6TU+hMcoWLf4emg==
X-Received: by 2002:a05:690e:d49:b0:67d:b3d9:4d7d with SMTP id 956f58d0204a3-67dd3fc167dmr1357561d50.119.1795046990082;
        Wed, 18 Nov 2026 16:09:50 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b508a8fffasm11811227b3.38.2026.11.18.16.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:09:49 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 18 Nov 2026 19:09:46 -0500
Subject: [PATCH v4 1/7] alpha: marvel: fix the environmental subpacket
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
Message-Id: <20261118-marvel-env-v4-1-200317e496c2@gmail.com>
References: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
In-Reply-To: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3408; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=2pCcGSD8Q2U2vRKlcElv/Q3go4/cqt+mECXmZN/jfjU=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+2Xl5hixtDixsn173razO+uLUkHUCJy8FHXbqkBGPc
 n+36P/Tjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLnm4mNGhgXLzL+IM6
 7L3iVcz+ClEMb042Lw4sXHSlLMPjMzd+1vkGNkuO/llGBX3FkrZNt70W1jx4038kIbltq5c4Skq
 +4WYY1hAwA=
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

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795142562;
	b=k7j8OrfdXr6QSDmCS7J5Szv7sEDUrar+i+ZC4bcYnlw67IWPjkIAumddDIWqc8f+9P7Z
	 LOP18CnBA5HDxKQbBZ6ZiW8rtQVoGYN2T8NuEbuMnuQsb34Z+pFMPu2mSpweDlHKGPJYG
	 G3wXN9SFOXxwFRq16ET8E+B4xw1IwF1hpwCG9D2qeEYcqTK1DlMmm/jhI1cwSPqpz33vV
	 RiVfseUtK3pLJPlBarqj6LNgB+/wmiURqrHXzIGzyYSAU4cd1b91HnZs0u9UI+PDCyAQO
	 5TYidU0O0BHD2M3YIwn9tb1FCUPLEM1VPzJS+zdZZUkZBwpE9T8f23Q+pjl5q6ZiG7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795142562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EF0vL6wEhy6tre/wASvym5RnC5jfEWcWyrd8wmWnmW4=;
	b=4A5gEGQzwALfy9OddcmQcabTX0/5j7oipwWT8dyFKHc1ftKj4rydFJ/SfdFqv9VC14zi
	 spe28rJU8G36aw7+/TRqyD/bZt5pXIdXhMeGNhJb1/PuWivQaCOWAQJ9bQsAI14CDmCml
	 1DaezkFChzaecS+QzHuo1MqqcXHXImsAJoLfmQw2oUk0D1SxH6WTu603FrX15VYEEwNNG
	 CLZzmYOceS2QCY2fz0/FOseS2/vL6MnV9Z/hGmPeFKrMx9utgB4n9KtA8rSFCPrVb47mn
	 s2YUAm2iCzm9M2tOTEgIKTHKKfCsfWfbGYJJWfrvfBdYf+VE/CitcZaL8PTEqDpYNBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oe8qZ4cG;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D23606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1D23606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oe8qZ4cG
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b3fb193c03so232204a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795142561; x=1795747361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EF0vL6wEhy6tre/wASvym5RnC5jfEWcWyrd8wmWnmW4=;
        b=Oe8qZ4cGxV9VAKGnbLuyaX0avd/zXFdOXXZx4Ib5GkdZtwkaUCefUHSJx/YCY37OGn
         2Qf4Zqp+948TZPyBytMhRn1Gba0nE7UEFENfwClnbZQEXLpduH/yOOkoQ+Go/HvI/y/1
         jTHzUKsknqsGF2AxdNV/cPXdKP11/keMLVuCycW8QadHU2KVXMUsurBqZWAWWWRTt3tM
         IDibg6hdCEwy2JKI4gVFMa+rosWzzV2fnvKlal/5KD30CtCl/0ukVYz6LbVO8JdApd9h
         qtLWdog5Vc3jT6nfXqQxFLYaTZbO33MC4aaTmh9CVh/pXJif4u2zBk3CZaUd1/CDUg3I
         CCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795142561; x=1795747361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EF0vL6wEhy6tre/wASvym5RnC5jfEWcWyrd8wmWnmW4=;
        b=C1zW5pxWrFohkNS5rC57QoKOFJPjua7EEKKAOSlyPMYugC4O461KyBDP3IOXUxn1CY
         vKbYD8bSN1Z029CnNzeEO0nlP40dxzKiw9ccrRcFGL39FI1db4zW5DtSwXpE7P3W477v
         LkaSLF9cwym1oO2i11z4y/hD4NWec8HWAAF1VlPym57ax+61wU/gWs/2gb9JO6k9nXX1
         APExHiOHnrhKvXi0eu2GicM/da2AQA5eRB8fg5bFairxPlnf7zf64Oy0pIVQm6oEu7Bg
         1A1AfQG3b4vL6/B6Us45OsriWl0fy7xFp0jzTFAinhGaqqHm0nX/Wto6lnQLOe5R5xEs
         Z2Zg==
X-Forwarded-Encrypted: i=1; AL+hErG4qKKLtDFKnsXZEDo3T2ske/gMxUu0sLh1DFzIzpRplPqs6f3aWmwkQiRSoAmsGJt8gyh9Ssa6CutteSQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Qe+JckdcV/J7BvXf6sqoX4pyHqKhqglmWIAyyNa2EeclziY0x
	pPS3Vj6/o8p1OY7kUIQk7nPzc92ca/2eJVGEEjxIPgfdlyrWpNLS77c2
X-Gm-Gg: AZFdTZfu5VkCmRygPPZH7WUzznPGyS+uujR6WifiVHRkxd4pfX7U0TxNZVv0466ye8F
	cMCBgkIUysmrRlO98qqHLxVWFHOlwmJg+I2958dcvDoM/+5vLKQkzv+LSyt/XDK8fUomWYBh6nT
	xlk9cNWc+woxiTBxM/KHJ1SAaSlC8ZJ4gO/Cru54anFktM8h7345AP+IiUno7NriGvnNcxBONqS
	h/76CJoXqunoeuKUIfZ2nh15+WwVjoJ3q8rs23oRBvKoM8psGM50URfzfj7u1c+T+7jggNWWjc6
	90EdUdVjrnjOKCR8qoqrloZ2nl5EhhzeFC/nw7/rJ0/rIkmZTK24dt/L/0fCbAtXqxs3zZ0hXK1
	OYdMcchDdbx896SFU9bbW1rH/YCUzvklBSjP02q5k1/eDJIfbLgTkZM6gCWkC4zKqzfH7pDEDv/
	Htnd83lpFCebGtBvl1LCiHo/Vv3AZ1huR7WC9xfWaoOVFKKbwjq8dYxIYcVarEWOAPJKq5ogQW0
	6OYJGAOaH+mqihYUSrhli1/xkMtXNDckBmVUwCBLMdBSbl/m6zWmxxmT26YHTohe0JvgYBCV5Jz
	vAwUC0ON547e1GqpWQU0fEVGXABXXXYNXsySlkXvGMV4Ajyz4Wk=
X-Received: by 2002:a17:90b:3d8d:b0:3b4:1982:473b with SMTP id 98e67ed59e1d1-3b41c98a120mr1116872a91.18.1795142561292;
        Thu, 19 Nov 2026 18:42:41 -0800 (PST)
Received: from u.. (61-222-64-201.hinet-ip.hinet.net. [61.222.64.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ffbab7fsm553507a91.0.2026.11.19.18.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 18:42:40 -0800 (PST)
From: Tim JH Chen <tim770802@gmail.com>
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org,
	chandrashekar.devegowda@intel.com,
	haijun.liu@mediatek.com,
	ricardo.martinez@linux.intel.com,
	loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	sreehari.kancharla@linux.intel.com,
	m.chetan.kumar@linux.intel.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	tim.jh.chen@wnc.com.tw,
	Chih.Hung.Huang@wnc.com.tw
Subject: Re: [PATCH net v7 0/6] net: wwan: t7xx: fix TX push kthread soft lockup on suspend and RX stop issues
Date: Fri, 20 Nov 2026 10:42:32 +0800
Message-ID: <20261120024232.133708-1-tim770802@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179514018050.3291.12379298766410717361@kernel.org>
References: <179514018050.3291.12379298766410717361@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> - Whether the issue was actually triggered, or is only theoretical
>   (e.g. found by LLM and not proven at runtime). If it was triggered
>   please include the symptoms, like the stack trace or kernel messages.

Per patch:

1/6: Triggered. Soft lockup in an s2idle rtcwake loop (SIM registered,
ASPM L1 enabled) on 6.19 with the unmodified driver, on the 981st
cycle, captured with kdump:

  watchdog: BUG: soft lockup - CPU#4 stuck for 26s! [dpmaif_tx_hw_pu:764]
  RIP: 0010:ktime_get_mono_fast_ns+0x2e/0xe0
  Call Trace:
   ? t7xx_pci_enable_sleep+0x44/0x90 [mtk_t7xx]
   t7xx_dpmaif_tx_hw_push_thread+0x1f9/0x490 [mtk_t7xx]
   kthread+0x10b/0x220

With the series applied, 10024 cycles of the same loop completed
without a soft lockup.

2/6 and 3/6: Not observed; found by code review. -EACCES is only
returned while runtime PM is disabled and the device is not active,
and I have not seen these paths hit at runtime.

4/6: Triggered in the field, reported by Andreas Haerter on the v6
thread (Closes: link in the patch). After "SAP suspend error: -110"
every runtime resume failed, the TX push kthread exited, and a later
write to the PCI remove attribute crashed in kthread_stop() with a
NULL worker_private and then hung in D state.

5/6: The symptom was triggered, the exact path is not proven. In two
overnight runs on 6.19 with an earlier test build that did not have
this patch, a modem exception was followed by closing the wwan netdev
hanging in napi_synchronize() with rtnl held, and every other rtnl
user hung behind it:

  NetworkManager:
   msleep
   t7xx_ccmni_disable_napi+0x42
   t7xx_ccmni_close
   __dev_close_many
   __dev_change_flags
   netif_change_flags
   do_setlink
   __rtnl_newlink
   rtnl_newlink

The not-started early return that this patch fixes is the path I
believe left NAPI_STATE_SCHED set, but I did not capture the poll
itself. With the patch applied, "Work RXQ: 1 has not been started" was
logged twice in a later run without a hang, but no modem exception
occurred in that run, so the exception case is not verified on
hardware.

6/6: Not observed; found by code review.

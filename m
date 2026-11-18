Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018067;
	b=Dmd4JrS44xtvIYobk8fF/HvabNufNtjr9+L/ZeQiO/mQI4B6WlgldGj0sWToxr0Trkcx
	 JZ73muf21lpcb9qPzHCTf1QeRgvPtLLEFFA1CteMv+8fIpCaMP1EgwiB6ZYmg+rfuOZhI
	 g2cF9cjzVEnQL2bkPSaiWqCAFH/9RpRrooAx5eCjGGPmGrTC3EnvAz4FPsCGsEVZpkDDg
	 zhcWVkQHLsB0KcPNF4G8U+aqMI8NecYdbFE8wHHDNWmXJpXvlp/x4bzsrSybujnd8YBlj
	 LO4Mq1Z/WFMqPl1t4RnnYtekVpktTqUB8MWAF0jdkmpyJ0nXHiddz7XEYkJild6bxLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=miZOpsXXWqTDg4brI3XNa3nMkTf1a4j0jITu5ECiOM0=;
	b=iTLZACS9AHYnA/eCNBRTb1zFhHwjzpV5YTPl0kSKxMLYJivLqp9Ea5rh2L+E76BpuWCz
	 VpuYIFPtHFeQ47U6gQ9Cnv5N3ihecxuA14FBgIyiS2YvAwq5Lj9ctKtowhcxvLSZRs3f2
	 Evm6Wq/pDAASm2rY5oO2T5XPbgPqHMw3e/ZMISog06NBgtZoU3L26cNJxtgyYD2WXo69S
	 5ivhId0KSD67mOk9fziEeSlehDPAdwRIGIfDIQh/BcfRes1ttfbawFXD0Szik4Nq8Y6Im
	 e67pNNBtJ0K5l0YHmzgfxgiN7e0uWVB761nIpjagF0Q2x9LEj2FV8KTHxGJyxHDkMeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rfERdRut;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5F260A3820
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B5F260A3820
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rfERdRut
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4ad4072943dso450154fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1795018066; x=1795622866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=miZOpsXXWqTDg4brI3XNa3nMkTf1a4j0jITu5ECiOM0=;
        b=rfERdRutCiY1Lz5trk/rT3JitdkQbyeRpy92SAEBTr0SmwHHW7GjbVlsL6xi4GLvlA
         eIy6I8HWFFPJEAko7lPdUqZJ0ASfQs39uGsb2kxFW41b1JV5vmuNw7JyeQ7RyefPZ0K/
         9xQMAXHoHzpNH4wuyizF2fSFPUA4p28V42dt2F4Kqw0BLpetMDyzdYPIEpOPJPmRoJPR
         CA0R4B7acExX6CwARQsZdifC0Die7wBlG1RRQSCl2BNtFRelYwu0NbJSKXPCQplp7vXG
         14ey5H5NU8zd6o0RiLfoiNrrbcb/neM2Pssr4bC/1VTI7DlntKS58QKULJCOW7HRil/c
         C9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018066; x=1795622866;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=miZOpsXXWqTDg4brI3XNa3nMkTf1a4j0jITu5ECiOM0=;
        b=pd226PzyHr+tuEpnOsI8GP7gf2qmuT2g+k8w5Ku5ql695+Swv3g2FztB72dhwytEYX
         3HCYYYyLTB0XXun2MmRIGtNuYIGZpbtu5QDV+pAxpHvXK99ekKm/ToaeRbLm2OE6cuhG
         KExtL7mcnwtaGE8stJZ5TEDExCa/mv2rGtFWmVTgFx/JBlGIpxAM2BFLaxCe18ak6sBC
         KqHgckPrNdB8HHbgiwP61EyVrJH+ituTNCPb4JUz/XcwKEaxe+g8PXQSJl8D5FYAsupp
         LP9u+jhhYzr3HqQlX3Aks9RoykuXJ+cZoQhu/6STdLrIGSBaq8DuwIkZ28zDg6pvyGFJ
         1aAA==
X-Forwarded-Encrypted: i=1; AL+hErG5bSVsue1Vzbg2XuMLULQO7Mgu1UlWyeM7xJEXdI8K0hp+DtZ3OW9tdKf8YXpjW0hyE2SJ0WfXJvR1Tu4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dwJ8NVsRtTaPrBBQc18Tw9KrHQwmTODQKEmgjjflmCeJlA2iq
	diFMkQM1RL4m9w75sXSIV4mUEFab8WfavRBocMhnAM55ewGtEDIWOHXpD7fCNR1SgWY=
X-Gm-Gg: AYBFou0yvesQMJJFI4v8GSC1R5iPSh0F28i8cli0WXswABACVKaYyELY5eesgT9Q6ik
	xJ9uGOPxqRBEyFnSAqrZWqdfNZcLMiwI+BnyMLoBfCjYoUt6NykHu4w3Q2pk+prK+ck/CpVxI87
	DSb5JF4KpXLTHF7EPE8HZakLpnu7xLIm603Wb1lnyPPAWd5GI59h+Vtm9zR7TejV3NTAvoIGnk7
	Idky8JTPh1QTGEP0DqIFftPgzlkZsTYvimNa+vZXR5MN/DXqYX70zuzVpIwAH3CduA0+1n6v3Oe
	skXI7v8R1lzAtWrHaVrMuuY8W1bJ8Fd1mspQyN81cN/AUbtAw6SygOxW9NLT+yAjmJRqFJLccR9
	t7yUmaFSZAMio4vAGslo0vmWfVBDr5qoVdPne5ell3lxGrT6N2SBFwH9qlOvsqssoUooPqciivX
	mrcS5wRRJecqw+ab4OOARH4XPen78an9N+3LMqMKMg5Gmjo2lvXziym6zCrcKyNaGb+f8cFrz4K
	dRPM5EN7w9x7XqrtioN6n8hw1Dqi8EKz+/h/cvdEVh3DQsCQXmLv2fnpAf7gLw0zUsNzRh5KlCm
	h0rb3VodYN/4qMhR44CXL/fjeyfBsZPhlPVWGFHXzK0ir36MH+qdy1SOYRGLxD0eJ+ldQ9V4vPh
	WQm0Xw6bPSa+8ro8joNPAjrAQAk4Lgl6E3nas3bGrua64XxRo32FQYxo9KAiGk/oNk9mmWs2Z
X-Received: by 2002:a05:6870:8920:b0:49d:c8ab:967b with SMTP id 586e51a60fabf-4b7620acf02mr2521246fac.47.1795018065606;
        Wed, 18 Nov 2026 08:07:45 -0800 (PST)
Received: from [192.168.11.112] ([96.43.243.130])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b743721fe9sm2624231fac.6.2026.11.18.08.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:07:44 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Stanley Jhu <stanleyjhu@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, 
 Brian Norris <briannorris@chromium.org>, 
 "Rafael J . Wysocki" <rafael@kernel.org>, 
 Praveen Talari <praveen.talari@oss.qualcomm.com>, 
 Alan Stern <stern@rowland.harvard.edu>, linux-block@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20261104112744.1630864-1-stanleyjhu@google.com>
References: <20261104112744.1630864-1-stanleyjhu@google.com>
Subject: Re: [PATCH v2] block: Keep RPM_ACTIVE in blk_pre_runtime_resume()
 when already active
Message-Id: <179501806424.17649.9429091372346585775.b4-ty@b4>
Date: Wed, 18 Nov 2026 09:07:44 -0700
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
X-Mailer: b4 0.15.2


On Wed, 04 Nov 2026 19:27:44 +0800, Stanley Jhu wrote:
> Since commit eef1d74bf88f ("PM: runtime: Only set runtime_error on
> suspend callback failures"), a failed runtime resume leaves
> dev->power.runtime_error at 0 with runtime_status set to RPM_SUSPENDED,
> so later runtime resume requests run sdev_runtime_resume() again:
> 
> 1. A runtime suspend increments q->pm_only from 0 to 1 and sets
>    q->rpm_status to RPM_SUSPENDED.
> 2. The first runtime resume fails in the driver callback, and
>    blk_post_runtime_resume() sets q->rpm_status to RPM_ACTIVE and calls
>    blk_clear_pm_only(), decrementing q->pm_only from 1 to 0 so recovery
>    commands can enter the queue (intended since
>    commit 6e1fcab00a23 ("scsi: block: pm: Always set request queue
>    runtime active in blk_post_runtime_resume()")).
> 3. A retried runtime resume calls blk_pre_runtime_resume(), which
>    overwrites q->rpm_status from RPM_ACTIVE to RPM_RESUMING, so
>    blk_post_runtime_resume() sees old_status != RPM_ACTIVE and calls
>    blk_clear_pm_only() a second time without a matching
>    blk_set_pm_only().
> 4. q->pm_only underflows from 0 to -1 (triggering WARN_ON_ONCE in
>    blk_clear_pm_only()), blocking non-PM requests in blk_queue_enter()
>    and __bio_queue_enter() while the device is RPM_ACTIVE, and the next
>    runtime suspend increments q->pm_only from -1 to 0, letting non-PM
>    requests dispatch while RPM_SUSPENDED. This hits the UFS device
>    well-known LUN by default and SCSI disks with
>    manage_runtime_start_stop enabled (ATA and FireWire sbp2 defaults).
> 
> [...]

Applied, thanks!

[1/1] block: Keep RPM_ACTIVE in blk_pre_runtime_resume() when already active
      commit: 657d7c48b84f2ef0bf885b47cf2318823bc72970

Best regards,
-- 
Jens Axboe




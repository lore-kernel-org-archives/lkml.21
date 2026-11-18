Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018073;
	b=1VKirn6bbK0Zw69J/oNTZ2tACCzi3kt7Cr4YKGUOaM6RJjMzq44Sebcp5hDo//aCyxNB
	 Fi56kZytTa26rgL35V/XtYmtnrohkwTqHKJGjcaUpd8yFaD4xvGGDtejJ9KuaRSbUHZ27
	 2bFI3Zm7NfI35+pMeKAM1wRRvoI6gIVuapbNMg3KyKlKvSCF/wtVEHo/p4ISZc+WoIyhD
	 HoFodqaKR+MSDojrgm65f6K6nP8V3GwarRR9hLds6Y9azugFyzeoyMQ1GiHzZEvK2GWRr
	 dFoJ49EI0e6Ym+nofHGMJK+/6rF3ys0SVbMqQc88eCkVv6c0TmzmvWlp439IsH0V6lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=Sq9RmYzcNH9B/wayIUueB9ggWDiYP1P/tLsuJW/Tbnw=;
	b=d/mFhd8t2np+vQzDGATmjmldpM9U7KMO9W2HsWJfrG/qXx+tTqU5Hi4Kc4adJkENhCtZ
	 8ei2y4GRhVkmDztiDVR9OV+hk2a+3hZZbCvSdcPuGKdcKWXiKUpzjN1bjAbtvEypCnP99
	 /swu1juOWaFH8Ws2FXCYj0lmZZdnUW+GmF2VO0fNg/LOCNUGTX0/+Xwn3LXJLnKOtMDvG
	 /NrjMER8p0aQojVC5BiyCErZkfEAa8ReSuOe78pPcGzC66anoMgn5VjdjtxkEIFMYeQzy
	 HaFA0UwX1AJSqsWllGQJRVREnM15dzAvQM+AZ29J4jwhO6IcrOu3a8cbK7+HVTEkqcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dTgR1f3o;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290D860A2634
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 290D860A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dTgR1f3o
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-71ad1db7e31so1502554eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1795018072; x=1795622872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sq9RmYzcNH9B/wayIUueB9ggWDiYP1P/tLsuJW/Tbnw=;
        b=dTgR1f3og9a0vBhrk79J1moJmlLMa/Fa6bpbkeW9vt/uz99+uvVA4CNebGriNhtftB
         3KScmsBDYtIouXo/NWiqMm5BqyXTGIO+u4eeRjaVUfcuM40shyAyRSXMCOkPd/cC26u1
         WOnHUaA5WQg8bQYexiUTpf73CbV4aB1kjJPhR3IiqikKxwcGjkzQP8iZidIuE55TfjYN
         C3ZM0ZYPIsNXrb1Jj3StcFa1N/5OsDo8WrytQXXoTjfJLgwJighHosOeOXNt0jL4rQQZ
         1NNE9jBw5/3sC6M2pYKyQIJddk8h/QOYHo2kWVRymfltt/Q/RhyBVcOaWuRehwkYH7o/
         pAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018072; x=1795622872;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sq9RmYzcNH9B/wayIUueB9ggWDiYP1P/tLsuJW/Tbnw=;
        b=hEKPbZ0jpHdp4ibbc5PmHidVo6MModxQa4nid9freSQD0w39wCd8Uzm07vr6pjKRln
         BB3GYO32lq1A4daH1ba4HQmEohy0GqeIZVbZDvmdY/DXPwF+SV4t0KHh/Gl5coFh8d0R
         O98dS1mMd7n83duF7UKBG5+nUw8MgaUAPcGzGNDGkCPmxEC9Sn5FhP/n64da7Zkg2sDO
         gj3PxpfyWWXJM3Mx6k/H1J/yVLxHifHBndCarZLvie72h8YsE0/tGOU5nJciAIi/PTGL
         siVlG1ZpCYLGeNTl3T1Y5Zv3ddmD8r1H7sBrpzWi6ohEPuCoNzFqGVgC2rB/3mY2acmJ
         Imzg==
X-Gm-Message-State: APuU4Z9yXxpPvMg46lY8knhFHx8etI6v2L7FPGU6dAvxOqsAcjKlOcvK
	x54WVScTuvbyfN1Gz9zbBUcvwAk8XCxriV8bvnH/0yjgGoLWlzxLDsgoRkMU58EqMAE=
X-Gm-Gg: AYBFou1plw/aopjoAnInjy3uA1Lgq90pJ+VcuEIsWM9dkAMdrsoV5CbvX1GoyUrMcsI
	wjPUoVmRr9k8hBuFM0s5XqKBwrcK/8QAEEkmvghmCC3exdvmhSbh3XsINd1I+8XbxgtZQzqTJhb
	yfan+sugXAoopuNiLg2C364vMDHxRceHIy3AInFIoe6Qpn0/vX0mi+FC9N/OEBwdtpRG3HYxLBX
	jvGT5CMnOtNsLbF5QLX7v4otLl0OVUP4On3HaNZaT9JICWAAfHQJDkKceqYEhjf9BarjC1MMQny
	lmKYYgUM/w1VkOJe4AtP2koHGtFt2BNaoH3qX4CBiAmks7/LWhaD+VH0KFT0wbzO3YiB8TVe74X
	MM26ipMHlriiB/x4cgUN54sm1zz2RE0EYiPhjVogFTnmVYEK5Yad+/LpbTfn32JkEL4AAKBPNH/
	kypW/ZEU0ktU/Uh/3ftFerPAN+5tQmvqGVXAgtqiVPMSMMS/kh6/g2iTvu+Nk6I7lPaRXf19hYv
	MIKDJch9RI4ojaoJPBfPCjz9Aq62jwZHboewUSo4YV8slQFIXOgQ2Xl5cqR6bNlIVZ/p4C8evEO
	Ok4QjDJStzLBPcLgS4JuK8ssurseGDposL3FR9j/0o7RUZarDX4uiMW+Kkj9jQOVRQAp5k+ierz
	tkhGOz2RpbKrEiyL+XUzr7gwjFsGpVCB29tXPt9r0l5N2zZdVq7g=
X-Received: by 2002:a05:6820:308b:b0:70b:930f:9a9d with SMTP id 006d021491bc7-71b028d29a7mr4357375eaf.31.1795018072097;
        Wed, 18 Nov 2026 08:07:52 -0800 (PST)
Received: from [192.168.11.112] ([96.43.243.130])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b743721fe9sm2624231fac.6.2026.11.18.08.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:07:50 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: linux-block@vger.kernel.org, Md Haris Iqbal <haris.iqbal@linux.dev>
Cc: linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, 
 Keith Busch <kbusch@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 linux-doc@vger.kernel.org
In-Reply-To: <20261111215838.103356-1-haris.iqbal@linux.dev>
References: <20261111215838.103356-1-haris.iqbal@linux.dev>
Subject: Re: [v4 0/3] block: delay support for error injection
Message-Id: <179501806989.17649.3138860274842922761.b4-ty@b4>
Date: Wed, 18 Nov 2026 09:07:49 -0700
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


On Wed, 11 Nov 2026 22:58:35 +0100, Md Haris Iqbal wrote:
> Error injection can only fail a bio today.  This adds a delay_us option so
> that a rule can hold a bio back first, to model a slow device.  The delay
> happens above the driver, so it tests the code waiting above the block
> layer, not the blk-mq timeout handler.
> 
> A delayed bio is marked with a new BIO_ERROR_INJECTED flag so the rules
> are not applied to it again, even after a split.  Christoph asked on v2
> to avoid the flag by allowing a delay only together with an error.  I kept
> delay-only rules, as a slow device that succeeds is the more useful case,
> so the flag question is still open.
> 
> [...]

Applied, thanks!

[1/3] block: Reject unknown status tags in error injection rules
      commit: d239710cf3e6bd5fec66766957c3752d9cfbd2c5
[2/3] block: allow error injection rules to delay bios
      commit: 6bd856cc99963b786cb530141745ef733de76cc3
[3/3] Documentation: block: document error injection delay feature
      commit: 5a29cfaf51105039d156dd8a61d2783e8b653667

Best regards,
-- 
Jens Axboe




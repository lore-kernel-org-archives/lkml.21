Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018071;
	b=R+2k+O78+fCDt6ujGcnI9hWrRwGQPux0mz2RoYeesIDrWmxcnJQ5FSFr7mSCKPzvDapH
	 5Kft+OVDRaEMTiqSZDBZdGQP+KBa/aexSFPuz0OBCT9RPRrlDdT1G1L8Wr4JpC/YMvXq8
	 oGfNmlhlU/82+U7sxUFwt3CkAVa07EZu+6s7UWcBtIjADKEKzqO/PqMw3/yAH/xqh3omW
	 gtc4gyy/LKhH669SJDfiElvGrOsl/87QEpTPrkYBZvSrdP85qIYsvZE1kWDdL1l38cK9Z
	 K0PC2wshnRFe5wGfLt3k9OU7j1M33ODC23cKmGrjj4frvoqCCErAyaMnwfYsiomcKTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=mrYL5WsZOMFb7NvjakVneJtwznSPE0xr2KZxBOzVkZo=;
	b=v2Xgoc3ffulcA0osrEnmE04agERmzhi/3DA0BsyD/BF2AaTZ8+cK84lV2v8wjaHmhLGY
	 46W5fZVIc30bL1VEAq9oTdRDoMFKGNE4yqTm6KjrHQdVZ4XV9mRYzG0AVMxoHEMDUsf5F
	 eJ4lOVI+vKNHZPN5FLDfAJwg0SU7HGLNiTvlBRzsRkkxCN7mEJRa84W1NbvKbV1jTufg2
	 cqxyFl4lCR3kdhv/bRioSIP+tqX3a27ei8lkRheQQZzKyVDDm3WFKLuhUw/93Ns7iklSn
	 jQ9tDYfRdiRU8ptg6sm44ztlNM0wOMRLGtfj/ZTmUkmQPFq5WurPYB3ndQlGBeb+bnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YVWFu3ON;
	arc=none smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE95960A261A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE95960A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YVWFu3ON
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-483a66818edso670767fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1795018070; x=1795622870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mrYL5WsZOMFb7NvjakVneJtwznSPE0xr2KZxBOzVkZo=;
        b=YVWFu3ONxADGZ1TCzNmmfe+iJS+iAMFchsUFgHqzrvGIenRCDA4yP0OeY5oGrttNMO
         slJiHcrBn4vK/OV4Wj1DXmiXQTMopiStBWArmcGzgF7YPGXGotfzkocwp3jfK/TMFmLv
         5Srg0A+SCJ+yXZRjjB7WCNe92jb0tltS5owxk0CfeBFdxEYmicaKS/5NvO1E8+CkTvBP
         tM1SjaPJ0iIQvMPxRcW3zVTg2o7DTQyMrnEDmLqFRbXTUvZVqw8ax1qdp55nbqGe6O1n
         OuZE5ZhthBEmxFctu10N1GS7oELzDXglU8hg+s2DO4/MNTnU2gWgaty6KW9J83D5xh6e
         iXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018070; x=1795622870;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mrYL5WsZOMFb7NvjakVneJtwznSPE0xr2KZxBOzVkZo=;
        b=o2C5u1icaB7GB4YsOygq4GGR6WO7F0kQVJ6cH/2vDGTgMXXxx2nO9BT60V9XPHK2ng
         Ow71haGRY1CBod9niGvvWVg84HO4w0GXQ9w2fQQ4DXEnYdDYyY8zQmDrIJflk+cZw1pV
         MrOivdw+DzdkQzGk+d0YLLxWQwhGIPg1O9xLp6G8HivNllLc6slDZPJ1BAkxQJ9MMHip
         QVV1DadLubkFrT473G+G6x7WFzvQ6QZ77XUT4G9Gfc8VwC3DyQFHRat/+o+UFiNwrFxr
         /xME9QVM6j0imx4lrvFsw9Xzr73HtQiD1j7d7ke6MKcJC0Vq442Z9i9AEJJ51e5h4QDP
         bgBQ==
X-Forwarded-Encrypted: i=1; AL+hErE6XJRoAw6GwGEhBUJBm8QPzGCmKNhHB3xS2WzSSsIsnmeojdzQx7lVWl7q2yBo9FacbGYjs4vhfIVBqiM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3bXk1pilweoFwZO+VxyZAdtb/D47WUcEmYrZF9OlO2vnsxkfY
	loXtMPIh4QCTRXEZ+QGk1+PWYF8gAXjHVgXJD6mwA9e4WWwHqNMFznmiEnZEsQ80NVM=
X-Gm-Gg: AYBFou24vOV8VViC1M+EZZT71oS9U++6gFbdubr1oJJB30uINmWzaCBUmlBxmUHcxPT
	lYjwBWfkSzyb85w5RFE8DKL5hP0OTQU6O+6+9R1MyOtgSKGqjte58ID9ZI1IA4GdMx2K8CJgAzZ
	o7IIus+rfApCZ5YqpJXZMXrXuM4G8GP1Bv1AKfodmXnWaQYnASWsDzJagvHHwUN3I0Qzd5VIoIs
	aKcyHtNBmwog1KE21Mov3INo9/PNVIOBgH40vuVRdU8XfeIswoW+GDUa7OFikqIH3wHUB638Jxd
	t77rSRzIsMbUDGMUS1bluiut1tMG4Dh9NHgIDVs6WzDJyLrzMzvWHW8g1cHv5vX0ouUAKBZuccx
	SGwJdXiaTpODJheUNORBJ8UsWN1W2X/5atGCEPY75h+UtS9hu6VoFdcryhPWhS6/NcrRvsXQbjd
	Fqx4PhwqJTp1DMe83Th2GMMVdGqVKZCaq3EP/WCu4tpNlOpJ+Mmv8c5SzHOmS3q92S9YpUSxVpo
	N5mSi3JxBUs340dLWEMNo+XZ9zggaZWUn7xNpN8FPxTjBmjfHOvJIljSdew9k+ZTJwSk5M9RN/g
	4GcNE+XsM4TGLafec3jOOpuW/R6qCemTy8hP0ilsatmvylh085rzmt2AT4mqCVqm00u5bItqfUw
	RQpfvqxxINMEATIDM0rf0nLkqIk3/imQD7Urp+KShhtidEKYy8yM=
X-Received: by 2002:a05:6871:2ee3:b0:4a7:4324:1807 with SMTP id 586e51a60fabf-4b75da54ef7mr2618439fac.12.1795018069724;
        Wed, 18 Nov 2026 08:07:49 -0800 (PST)
Received: from [192.168.11.112] ([96.43.243.130])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b743721fe9sm2624231fac.6.2026.11.18.08.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:07:48 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, Mikhail Malyshev <mike.malyshev@gmail.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>, 
 Felix Moessbauer <felix.moessbauer@siemens.com>, 
 Josef Bacik <josef@toxicpanda.com>, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20261111162705.1150983-1-mike.malyshev@gmail.com>
References: <20261111162705.1150983-1-mike.malyshev@gmail.com>
Subject: Re: [PATCH] io_uring/io-wq: apply the current cpuset to new
 workers
Message-Id: <179501806843.17649.11773219766773468762.b4-ty@b4>
Date: Wed, 18 Nov 2026 09:07:48 -0700
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


On Wed, 11 Nov 2026 16:27:05 +0000, Mikhail Malyshev wrote:
> Since commit 84eacf177faa ("io_uring/io-wq: inherit cpuset of cgroup in
> io worker"), io_wq_create() copies the cpuset of the creating task into
> wq->cpu_mask, and io_init_new_worker() gives each new worker that copy.
> A cpuset change, or a move of the task to another cgroup, updates the
> workers that exist but not the copy, so workers started later run on
> the CPUs the cgroup had when the io-wq was created, which may since
> have been given to other tasks. Workers come and go for the life of the
> io-wq, and a worker that cpuset moved is also retired at its next idle
> timeout and replaced on the old CPUs.
> 
> [...]

Applied, thanks!

[1/1] io_uring/io-wq: apply the current cpuset to new workers
      commit: 0659e44ce739ecd856164c75a5325b7959a2921d

Best regards,
-- 
Jens Axboe




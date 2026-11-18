Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794978260;
	b=QpP6TIoyiMQ4ElwUZGYdWlzg2Uc+UUhGwidTIqVrEK2HsD7CfHPPjTnMz8tbS+Sp9aoh
	 L39QYAPpSC5BO4qRoxOi/lipX6gIPkLQ1/GLx2Evaw18vvD/c2c+oQGYKOdK6UZ1odu7S
	 5fqLpuXDPw/t2YKCFoWg6TOlDJNE940aN5sC4IHAn9OgBIJSm6St0jS6o/GXioVRhUkEP
	 tafuuwn3ltFx88hvuYkxPeV4h5hjNX1kfs70K5LbMr7M8v4C7VvMG+M/snTN2Ir+Uq1Z3
	 DGn6rPaI73kiUTl7r/1AKSHyKbVxP5nXoshGUejCyS+z+jB4r/jugovAoUTPXSBiYQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794978260;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=fHKEKHdPjoZhYVJRZoCAKKckDq3mCm+7VXF61UEPMbE=;
	b=iG2T7t3oJSqaoDUyveW7uQTBupTgkTQcykSpN2kCl1mTyUmm3k4xPuyFfFI7QyY3bfF/
	 ECs0qCBqV4O09/nwyhL/6nv6u1ZA50T/Dlh7MMkFbzaeDOHGwzMxgX/smoSi/VHj/n6Br
	 lcY3gqH4JFZPBm5kGM0rs5B58g/RjQ4QRSuvMbY1tAs3S3j/diNHVvSnYuAGXvfePNnx6
	 cpEPTMhtwpPLq+ATd3Fg68TwDInMp3LfmDTvoAUt9zoy4Vv4wXtlJEsQgU+NnPxTDc/68
	 HCurPOf7l+xcntegHl3uHxEpV3aXR0RQx2pBuC+xAdbSzyuIHfC1QJ82iv49o/rKSRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B5C606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49B5C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4cc89e86e4dso606124b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:04:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794978259; x=1795583059;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fHKEKHdPjoZhYVJRZoCAKKckDq3mCm+7VXF61UEPMbE=;
        b=h3XlaCi4GwlXV4OQ9XijcuYHsKQpu25MqZe7PFiDJf3MWIpQBLKeFCYTC47kMkQ5yS
         bXAxroavMLOv2RexBLUZg/Z2o9iss3aMEk2sBx8iJB2Cecaz1+mlWnW8IrTuKwCoe63z
         RLocso749R04h10vplmSjmXjLzGKCITHQa7FiQcS2YtLDUHyDnQxqMfzsQJSqURFPrNU
         BspmUaUd089nVTKQpYF7937/LBiO6824psgJFZni1yHfeAYtFy8HLrJvJIgiPO3kH6z5
         l2zQsKhXE4T2lZ1Jpf4qq1ZevkcFOjkRlpzUC3gJi53clSlZtkWKwtvMX4fIFdFKl1P2
         /Nyw==
X-Forwarded-Encrypted: i=1; AL+hErGazKf4HvbtuRe78pJlVxceLk1f+pQiHvp4ds9TCrCLQ4cws5XV4ZBLtyMGMLGrqhxRFGB8p3LNVaHUXW0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+coH5EZMNIhAR20yZOo24Udkh5QHsmzvD6nni4r1p8HS8VYZx
	K6610inKN9I0/uD+f1JXhhGLuF2L4ojXcEKb2fB4HitTBpGs4CAFYiAYTr+MpfoH3zEfrybKNPo
	ucEf3qPUlpbCEvJXBwUPk94qgAcaNhMZVm6D50OvIauRoHYUSL37YpsWzDeY=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4fcb:b0:574:82cd:a022 with SMTP id
 5614622812f47-57741c1eea6mr2354609b6e.15.1794978259303; Tue, 17 Nov 2026
 21:04:19 -0800 (PST)
Date: Tue, 17 Nov 2026 21:04:19 -0800
In-Reply-To: <6a8bd0a6.91706f20.16b6e3.02ce.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6afd31d3.8f566acc.2517be.0016.GAE@google.com>
Subject: Re: [moderation] KASAN: slab-use-after-free Read in uprobe_mmap (2)
From: syzbot <syzbot+1340ad4350ad43394c10@syzkaller.appspotmail.com>
To: acme@kernel.org, adrian.hunter@intel.com, 
	alexander.shishkin@linux.intel.com, irogers@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	mark.rutland@arm.com, mathieu.desnoyers@efficios.com, mhiramat@kernel.org, 
	mingo@redhat.com, namhyung@kernel.org, peterz@infradead.org, 
	rostedt@goodmis.org, syzkaller-upstream-moderation@googlegroups.com, 
	zafir.taufik@starlabs.sg
Content-Type: text/plain; charset="UTF-8"

Auto-closing this bug as obsolete.
Crashes did not happen for a while, no reproducer and no activity.

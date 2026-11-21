Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795298143;
	b=ST3oVenLgNCwdiq5VS4WlRZ3EfYoisNQnRMqG1SIPO6wj1gEaStHfbky52CggtfBDVeU
	 SBe6u+o/n/9E7wMb3w29N7owqwkWRhK1qn2oz6KqF8/zQ1ySMl53N1kj65q3p5IQM1weS
	 XzkX0PI6SnZvGFZ674d+He9wYf2FbdV/0Jn9heSsLotdE4n7V3RoKsuLztynTH6Ez1W+t
	 TyxmmFPfmNqhJQzNhehDaVoMCU/bQ+rr1AK92c7zNIowq4RAWLi/SR5lUj4LIvT/eRjP0
	 moakhpioKvutdzk2v//L+joGiTOXO9d3p+IAWxCcDQaaI4y2Y9Is+80Z+xunGUFMyVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795298143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:Message-ID;
	bh=KCjUtohJo1syh5AF9wt+LVHJxvbyrd0qzAwW5js+pGw=;
	b=VVrP/tHvRpAzTfZzTQjum/oqrz/VxLPFK23+LgF0OKs3obD/sMIaW8+5OkQtaTOUES9N
	 97vHkbdEjOcQDMVpJ18LWXyGKs1aoQa2cDvG+gI8iDXEEA8szyEwu1JpUWhXPgt3fTcS1
	 6JmmFTWCUogYMQw+HzouT2HGj6o8clwxNPT6G2ZRqNg3RBKoCQLdA6O+dGWET8+aG189U
	 tVO+HZv6l004lj+/XUwTGRkmO+DpjeZU14RqrAQqq2sNwaqbuWz5/nuSnAGpbREKibTbf
	 Vxh4VTFLvNd/6oDgGyd6VTpvI1rVLD+GbznVfuzHnXiD9iqSxzGRf20JQKvUljZsI4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=elRo4E8e;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F20606A33A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7F20606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=elRo4E8e
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so2678454a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795298141; x=1795902941; darn=vger.kernel.org;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KCjUtohJo1syh5AF9wt+LVHJxvbyrd0qzAwW5js+pGw=;
        b=elRo4E8eL6Ff9JTxWokGSChCv6ga6xjLaxbwG4IuokCWQcX+8wY/4TwbB9eLmqPNvd
         Fh3vzMvwpzy/pOr2RX9SlCQFI+Hjk0445UVSnhuh4ztDmhLZM+VCJtLlSDSy7y76lSic
         c37MaL4b1Qz4CtJy8OeIs3V21nTsac4UlO4hgwJ8SnYbq9OyCNug0iwYSaixQfjAzjpY
         qPi9C6xCmDJPR0eKep0Rxz3wp82ZhOkjc38M9DvXOyC5JPcdEuj9G7TBP8QX4eJJsx/n
         sOs4jdQxDBwnYwTPuxSdyz7MRdh2JqrOe9sBMUh6XX6rEf5X3LuB5PNqbH0zit7TtGC9
         NUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795298141; x=1795902941;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KCjUtohJo1syh5AF9wt+LVHJxvbyrd0qzAwW5js+pGw=;
        b=zt7gJqJZb7b8GyclVRa+f7JhJkcIrkkCmoSPgiW9PK7JQeeHDwEuzeuBMb/EEBQzlN
         kpcP53psAnDITCii8OoYqnP/v0HVla7+aXPXzlyjW0Il/U98ZteaQD/nG1e+gV0rEyqF
         WlJ0BkLf416orr3QmcR0LrOL/NdbvOYLGCFIrMl5H1yo0fL3j9HKAScZC/Atnvb7GT6y
         7fzNzdWbEYDizzy3ZGmPTiqyzViw9UdBH5xR2IXE01GjncOay8gAVf6bCamtkeWxBZLn
         /9n2BzijB9/wEZOsIyiJOMoAeILZ86DlGg0SYFV1+AnxUVqDJOx9ApAY/7dpqwBfwTrV
         scuQ==
X-Forwarded-Encrypted: i=1; AL+hErF/5pfBkDLR8dzreeUAP5zhz/PpIYSn4IgpLf7vQant0RqeUDM2vZPuCYz5tsuXJMPVWJ2Y7SXVkZ3S3Ls=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vPxn0EpM0+ZS1pedL2cZ7t7TxpMEBqzsUErJmQykVNi6KECH9
	clXdWtZpOHollqp8HEabwATfltLBDzk1rwAcitKZS1DxcCWr7rJFs8tSwoBEMNeVoHfQSA==
X-Gm-Gg: AZFdTZeaGAThiX2l8f4GINI/DaOSoPoVeKx/KdHC7YgT2tsJtY3asNzZt+qfGnqza1k
	56s7GgJtDuPBUOB5P7oNpyXhuyvyBr/ZA5hBvCZJX6lwWBm1DRDkJuV1PZ7MmwTeMiZ5yomfEVr
	thceAETvEy8PttKd3ZsGwr3OV0TI9iAPhkJFmRj6kbJiBuVYWlp0s6JsBq8hQ/A0+MOWc92ntUA
	hRnoIxqwJmMjG6J3ess3fyiM6oTCEA7NmlKVXlQvzR+cGEvhjXqLDe4inF/R5YpSkIU9GGMncW6
	F9jbt1h/ss6mTwgzz3SbwrO7S0YN3PdMbdK8fLlZdVUyDZaHWkav449c5YF4olJ/78UjzxfyjiV
	oCldLQ7pdq8i8VTvmfDYyClGAREwkX5g5Srw54LT63WcNif86FhOaHgQamBGDaJEubtjUZkR7S6
	hKQP3NNc/5rOPUHhPrluS1/Xa/gqUoqRPRcTu9W3L1bLWelb/6Go+BS/yAoJ4JEFIqjdvEmNsat
	yOptwGqJMTJKV6vhLDP1kSp+sk3xDkVMNpPWRzZ4N4JkxWpUybx8dAnPERt4u8V08725Bg920Ut
	ZUrvNooJ6oTuO/mb93sYQPZKhQoE/RDS
X-Received: by 2002:a05:6402:13cc:b0:6ba:88b9:71e6 with SMTP id 4fb4d7f45d1cf-6ba88b97656mr636301a12.14.1795298140925;
        Sat, 21 Nov 2026 13:55:40 -0800 (PST)
Received: from [192.168.1.182] ([2a0c:db40:0:80df::2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370faeeasm3038747a12.22.2026.11.21.13.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:55:39 -0800 (PST)
From: Konstantin Nikiforov <helllamer@gmail.com>
To: linux-raid@vger.kernel.org
Cc: linux-bcache@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Yu Kuai <yukuai@fygo.io>, Song Liu <song@kernel.org>,
 Coly Li <colyli@fygo.io>, Kent Overstreet <kent.overstreet@linux.dev>,
 magiclinan@didiglobal.com, xiao@kernel.org
Subject: Re: [PATCH] md/raid5: complete unsupported discards successfully
In-Reply-To: <179529607529.5.3302391929789139470@gmail.com>
References:
 <CAO96y0V6oncv54ihXnHfJMYiG_QAQ-NM8BOdqPDXKL8r8-kR9Q@mail.gmail.com>
 <179299857972.12222.2729359466842183358@gmail.com>
 <179529607529.5.3302391929789139470@gmail.com>
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
Date: Sun, 22 Nov 2026 00:55:36 +0300
Message-ID: <179529813639.2.16814857958553170519@gmail.com>

Hi Kuai,

A short follow-up to my tested-by report: I removed the udev rule that
zeroed discard_max_bytes from the md75 initramfs and disabled the host
copy, then tested the real HDD-backed stack with an actual discard.

Same kernel: 7.4.0-rc2-md75+, md-7.5 tip c526b7cd32f7 with b964c9240a37.
The stack advertises discard again:

  md126:   discard_max_bytes=2199023255040, discard_granularity=1048576
  bcache0: discard_max_bytes=2199023255040, discard_granularity=512

devices_handle_discard_safely is still at its default (N), so this is the
raid5_discard_limits() path the patch changes.

I created a 1G scratch LV on vgpcrd5 (dm -> bcache0 -> md126 on the three
ST1000DM010 HDDs) and issued one 64M discard:

  blkdiscard -o 0 -l 64M /dev/vgpcrd5/discardtest-md75
  exit 0
  /sys/block/bcache0/bcache/io_errors = 0
  bch_count_backing_io_errors in dmesg = 0

So the real bcache -> md126 -> HDD path also completes unsupported discards
successfully, not just the loop reproducer.  That was the last test item
pending from my earlier report.

Thanks,
Konstantin
DeepSeek Flash v4.1

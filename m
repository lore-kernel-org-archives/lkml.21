Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209037;
	b=3XNxtSoz0SuE7IUjcrPyO7fupJ42PrqYEz0IGMpreJU5t+DFpXPg2WFIrP4TeKFcQwzk
	 4qThIXop8A+rcNTaVZ/2m1jaPN1sI3/1TJIYLBPPz5BdeOiOdSjMc6+J1Gc7SLBzg3TEN
	 O6WaMEBbUHdQ+KEFi4lPVTNzeC2GpIpLD2C6aDjNgL/QLluDoMKGn/JzeEph/3gV+I/uQ
	 e3aAdglrk6dHi8VeSxShoO5ZAbhpsn/gQZ81GfOFbJiHGKytYrOGW2nD2FveUnPbqNQZx
	 F8GgPAs7iT0qKkiAvzvbZkijG4oNa7bniq6TGpwfTPez+HCSwX01mReV3IxcBUBLRCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=kF5gL+pAF0me5uE64gOZsyv6XMkas8uXTYMZ5GaQlLE=;
	b=W4TYPvPUQvTtv/b6KAxCEeNMUUsEdPXv/JJWwnhvAofZGDFofptYQWAWqGZ+HY7wGNG9
	 /BstfjCoWG4tgMueYCm3gBwjz4YT+vvMdmv4zXZCIJkgeXZ5CJAbAYDu/K1qOoXOl1U5O
	 V4rkzBheRvAotZIANMWSDLy0JB0xJbUhTJUgsOK6NXnxgzxDC2WdnPykGc2/fRZqddXus
	 7+Bda02VOMJeWqBBOv3qprjrDyedJl6zGXk2AYpcWDo5XTE4lnMXN9r6Ski41DuNj7xqZ
	 EfjCUvKn+7fXl/uQ69a9RLCAHvnHylGgXpYqaJRcug1AYmK3hhEUFH+PtOGzG3wlTKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zuIZaxPV;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E508606A6A7
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 21:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E508606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zuIZaxPV
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91ebf4cd218so8250026d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795209035; x=1795813835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kF5gL+pAF0me5uE64gOZsyv6XMkas8uXTYMZ5GaQlLE=;
        b=zuIZaxPVcQBYCWlwNIcUOn6S+p9cKGlwbNfwBIMAFmA7b7lwps/pqg0vZNa9OqpL4D
         WxD5wMZH2rDQ/a6noXkYNfcbh/jO/k4JXD2eg/XqYDmyyJPlAOWiAI61HeYYEb0RE7EI
         hmk9TrpycdqnKq8E7SFmq7YHSz757khQgSWdtOEd9GYDkSnoxdSUKOXg3yVR3E2Riqld
         djF+4w38VZsfPkj7ZI7yfj+FV88ApzTYEOl5/2Kdq4RAyXASVfqp6xV1D0+xiSVhZeEo
         ReLYy/ljSDA/LmjIQE8awbXYFDTuRPwwde7ASBAqsym7rn3nr5Q3p+X9RslOuw9RxJMz
         J6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795209035; x=1795813835;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kF5gL+pAF0me5uE64gOZsyv6XMkas8uXTYMZ5GaQlLE=;
        b=UD7Bq0kkiJoE2b+f7DLZ5iSJPmoJ12n3GbcPKJJGQNWs5pxEhDixf/XJqMlK3IQpVa
         3hY/ttCR+0YI8m9IOVAx/oUUcf9B/4vLUUzfkZLluGaZzP/1km9htYikIXwwDLpJEaEg
         69YSZRYyKTGHykHCglWLafUi2aW5hYFy6opV/vr30JxT2WstgENl0Co7ol4nybFjpc/k
         aqDg9Citsxzd7TJtiR6eJBqvTuiLXM5lIdeghIKpKx+fWeC2XsO1blBeEUobGw/HQa0c
         FFvbjnFtCpRqjuY8P9DdipcVYdvQ9lbfdwPn+nQR6MkV9jJwqaIT7SjEt//d8ZGmLokf
         srow==
X-Forwarded-Encrypted: i=1; AL+hErERflT5Tikd+u0FfMRE7x4Kaz9U2opaJdu6PN1Uwuoj8CCuvRSniKIU9gYD8rSdVnwnIh+RBJ/lFOm0ckc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0qAWs1igFL6fKd2UUKrv7JS9pFarbrVRoyCAHOtxpXuzGsilj
	ovDT50d82WmpFrlI3wa8MdIoosQssKCoeXBvjvRTbrviGF+8jhr3mRWM3Bfhceiw7NU=
X-Gm-Gg: AZFdTZeGDe2h3WHvarTu0ypx3wpwbxFmm718zUr/oURpQxDdPL9nerpQV1ZnD9kt0lC
	iaQ/PpnBNV0cnx15z3D+F/Dpx5mA+qIDwERLx3iE/zqDcsnl27DPY7eZIuiD8XdJkQrWKehOQU8
	GPyI6tB0mK3BiPtBvDGYdZibAsXzwYFf18qwFAmhNxVBRBOfEVHhwiyXaHHx8+KRSIDh7E7Pdzd
	q3v01VUhDf0J4LGtx+cs5tDwFxpPaVZ3tuYV3Aaf+GbOhJHnAP44+p47E8StzUbRR30/pNjJNE3
	nOB3adnt2fFHnS6jj7i7QKxRsdgbZVJfM6L8lptbtKSPYaPOB9w18gwJ49+tAkgT/kqdQff+YPV
	8t5G5rMWLWpVxvINRM7ReRnZ9S9yCqMLvz1ovrG1umYOpH0ptnxruHMx79r3xBBThnZNm64biZr
	yaFc7EGksj/K9U/QGWjji6waxbh0LEet6qCGmmQWNHoS1c0ZhAac+QgumaNWRZxJevyhlmAqdSf
	Eq2Gb4bp4T/AGEBAGwAdYXhvoXqGW3vmjtXSwGAzgiMUdni59JnAzSV6QMq5wQ8BghzJZRzmGQ7
	uO6AmC8rdiX/c/PBq04KR2+zwVTh5LYJk6bJKqXsXnSsbANld2orEj8erpVRaudUZwwWQ/Y/yCu
	2ACYCALOwODBWhcDXoUPYwMyYmhhUzsL5jvDRNNTdTUACUk9ET4i8S816fBi9eCTiyGsr8by1Pr
	H1yrDIfAGoQjoGWcnABcKPlfh0wTUc1FiZweyPe7tiu0aGIgh7WC8+MHY+bM3lN7s=
X-Received: by 2002:a05:701b:2704:b0:1b5:4f6d:8277 with SMTP id a92af1059eb24-1b5568e78b1mr3904504c88.26.1795208605472;
        Fri, 20 Nov 2026 13:03:25 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm8865172c88.2.2026.11.20.13.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 13:03:24 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Zheng Shuhao <viennaoffh@gmail.com>,
	linux-input@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+fb951970a334aaff00ba@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] HID: hid-sensor-hub: avoid lock inversion in sensor_hub_remove()
Date: Sat, 21 Nov 2026 02:33:16 +0530
Message-ID: <20261120210317.184756-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120121256.35339-1-ayaanmirzabaig85@gmail.com>
References: <20261120121256.35339-1-ayaanmirzabaig85@gmail.com>
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

On Fri, Nov 20, 2026 at 05:42:56PM +0530, Ayaan Mirza Baig wrote:
> Changes in v2:
>  - Pass 'data' instead of NUL to device_for_each_child() so
>    sensor_hub_finalize_pending_fn() does not dereference a NULL sd pointer.

...

>  	device_for_each_child(&hdev->dev, NULL,
>  			      sensor_hub_finalize_pending_fn);

This line is still unchanged context in v2, so NULL is still passed and
the callback still does spin_lock_irqsave(&sd->lock, flags) on a NULL
sd. The diffstat (4 insertions, 3 deletions) matches that: the only
removed lines are the lock/unlock pair and the flags variable. Perhaps
the change didn't make it into the commit before git format-patch?

Separately, Zheng Shuhao posted a fix for the same syzbot report:

  https://lore.kernel.org/all/20261120135005.566-1-viennaoffh@gmail.com/

It passes the hub data to the callback and also skips children without
platform_data (e.g. the HID battery power_supply child with
CONFIG_HID_BATTERY_STRENGTH=y), which would otherwise still be
dereferenced in sensor_hub_finalize_pending_fn(). It might be worth
agreeing between you which version goes forward.

Thanks,
Arnav

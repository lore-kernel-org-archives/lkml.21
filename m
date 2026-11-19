Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795119363;
	b=d8EhcS/0yo4YIza/7/NBHzyX9EldcPnGvTcTCCc9xLQdqrt3P6Gm9Yd7EdS8tDSnTciO
	 GoCwx3YL8C+JtgozbZCHablpxqRSm3UYiyvy6DGW03s/u6U45Sop0yIr/u54inc1YQyjo
	 rzleQ308TYT+do/OFO0qoW37w6ep/KbDwC4g1J+I1Ccn7f4T7yMGAvPOOkW16WRh67l4U
	 1JtodZUwr7SazxNnvf/MVyUvLFvtvW9G29vdx3mgOz2LofwSFF16z3hz833o6vwaSZQYA
	 dIqlyCGaee+KlOrHBEosZqTE450ft74znmqbPqYLLmeXiRTjyHv5uEjIIQNXCKmos0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=IioXAUgBLX6qGXmIL+lHfh6K/SMkoqjXHsXvXuXc4kw=;
	b=QBcJn4oO6weh6tr0lZ/QcTCLrAMnA0s977AQ+T2pcflvMRg30mwJJs99PnodtuMxv6ex
	 +anoT1gK13YC7pDiwqknPQWD32cIxwjDPIeYDIvYJ+uanf8nSdV42vEdpmeM81cdcHHl2
	 z3GYti9xJQC3X8yJkt8rv4wYIifNZcE3vISCgTtJ8+VwC1vV78U+e5aPJ9LPbdGPNuTsJ
	 +eLMWhnU98pKkZu5bY9BoKjvvdzH9vN8Tgwr3oNZR886kbUTPRRb9+I2XxPlqzmgz/jaQ
	 7900qRtQkqekSvMyqEQ8Lfa5UWMyvQi7Tm9y/X8xTrXlpUva9hq1/jmylNccSbR2M7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yinSp1IW;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568F2606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 568F2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yinSp1IW
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36f8cdd30beso189479eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795119362; x=1795724162; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IioXAUgBLX6qGXmIL+lHfh6K/SMkoqjXHsXvXuXc4kw=;
        b=yinSp1IWy19Mc0Uvru8QtwhV79tjjpVKWi1+9FHUQHTEdVmwh7FMqghXtoaFhil3Up
         HuJyR8YsyRLwKs4GnH+Dq5WPejkKt36FY7awxnFTJB0xJB3kuj0hjJ8LjQHaNYiEaKLt
         dcGwROZVLMg4UrfyMlUjcNs59EyPsnwAkV+ttTTNnaZMx0BOOaS3ovLp9O5ZAWLK6AeB
         ZuAEHqj3ZflLDXxARL/LXnCzMb2gmeEJLIcSsZHXdUyfF+n/4zqZvZgZLFG+tmG0sNA2
         GKL5jSf0lxUk7HNvWtwDf2IkOW5uKBbVI/ZS2ENqhhG0wSeCfavwncA1dCEpcxCDleB5
         /rAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795119362; x=1795724162;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IioXAUgBLX6qGXmIL+lHfh6K/SMkoqjXHsXvXuXc4kw=;
        b=MRn5qZ/Dt2CyVHJq1sLwxyWam/gd134Xir7Y0C9UUUI4Gw2FIXqMwufZszunvAJOhS
         suianUr6MuuEavMvrqvRFFddCcnxe7Xns7WNpMOAqB7pZopixUQyfqZyDKxyJmIavwtH
         cjIQlKi8+63BqR1ZIEIamGBfS/ZHD7VUFSv+dIxn8Uo82j20IYeZrrnSvqDY6/z6+jDV
         43YundENcDsS7zIHMhYvFWcJqaZFX47ZrURt7q4IppUTBSE3dtLmTyJek/km5JTcWl/L
         Izinh/xvyTS8ICJSJAhX1rp46bRaL5PmvPIcmQXWm1AzmoNryfVIHVmGtgwVb2tQbT41
         fXcA==
X-Forwarded-Encrypted: i=1; AL+hErG+Er57mvnVd5b2XdHE5WHInoB3IlW0ZaMfSd/I356jEfhbrN9RAUJDz1z50SV31rIU2JuS1r2JLF0gKXk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Gtt6stxT5LcAG4tseIBVQ4EtXuGF7AeKSG68OlxJqW60+HMkq
	lD24az+y6sNLGNF+scCmI+2NTuG1niu/08NpTnBqd3nnVwxgJ/ky0gLP
X-Gm-Gg: AZFdTZcrNYhjcipETCBJQELPyNYw+mL/odilRCxOmsghsXWsqtjDyvTrezK1E875Gdv
	GnZBu8xt/7iCiMWp8PFNU1rUHZr9Nj6OVc2VHmN90+emtjQjxzKlHee0x0Dm4ADTRV/qXKopJ3s
	Dp1Hsg3SKzRZQIakE4pMV0zlHwgEvZMlfpEXGLzHLtd6kvFxLe1eu1F/J7JV8pyAkl+hz0IzSfW
	Q96OWPUFwSI/RkS8E9oZTPGjcwXGaAcqmwm0BpCFzNeRa9mjmWqXmSdQeOzkwrvUMse0t0jiB/W
	iz8uSkD15Xls9WvpyMBPTTf+6pvxWbPhImXum793nZPx4uKhO16eaVDkZGT4gPkzfaGDKciT6cb
	z4m1GcfDwCReZnpDu33bYQZs4N/ZRyisG/56XHwJarXM+5UqPEn6/zxlYmCsqlLYB3pykx+w5ol
	5LamXLWMksytCqQvNrEPjNe9RIjCEMXdjbI/OW+MXcurh84qCh1UxT2QCeuC1A8iW1bGzS0wIK1
	gFmoi/1wYp4QAxv95ukDBkiqwOlIeWu7EaycCcqDoa0E0HtZiqTm+F8+5c/sL0JBOtUZD3ZssxJ
	PI+PTTwSJjZGanVvNle1qLOkPss4ht9mRo3S3aX52F7GcAZMbtNJuEh2juMuOF7uBsPaHKmA+iR
	EM3VYIP5Kg6EldZO+oT7yyj10KQkNwKLloQQEOt6++RRYe5NCO7NYYLB22xRua/5mVrdkVbIM/Y
	8BHcMbW8eunGVDf0kXYcvTkSm0EEH8SkmUSSRUScfkeeg=
X-Received: by 2002:a05:693c:87cc:20b0:358:3426:d601 with SMTP id 5a478bee46e88-3856c0d0961mr448850eec.2.1795119362463;
        Thu, 19 Nov 2026 12:16:02 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm1097351eec.28.2026.11.19.12.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:16:01 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-input@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+fb951970a334aaff00ba@syzkaller.appspotmail.com
Subject: Re: [PATCH] HID: hid-sensor-hub: avoid lock inversion in sensor_hub_remove()
Date: Fri, 20 Nov 2026 01:45:55 +0530
Message-ID: <20261119201555.185270-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119192046.1015750-1-ayaanmirzabaig85@gmail.com>
References: <20261119192046.1015750-1-ayaanmirzabaig85@gmail.com>
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

On Fri, Nov 20, 2026 at 12:50:46AM +0530, Ayaan Mirza Baig wrote:
> Move spin_lock_irqsave()/spin_unlock_irqrestore() into
> sensor_hub_finalize_pending_fn() and pass data through
> device_for_each_child(), so &data->lock is only held while inspecting
> and completing each child's pending state after klist_next() releases
> &k->k_lock.

...

>  static int sensor_hub_finalize_pending_fn(struct device *dev, void *data)
>  {
>  	struct hid_sensor_hub_device *hsdev = dev->platform_data;
> +	struct sensor_hub_data *sd = data;
> +	unsigned long flags;
>  
> +	spin_lock_irqsave(&sd->lock, flags);

...

>  	device_for_each_child(&hdev->dev, NULL,
>  			      sensor_hub_finalize_pending_fn);

The commit message says data is passed through device_for_each_child(),
but the call still passes NULL, so sd is NULL in the callback and
spin_lock_irqsave(&sd->lock, flags) dereferences it. That would oops on
every removal of a hub with child devices, instead of the lockdep
warning. Sashiko flags the same thing.

I think it should be:

	device_for_each_child(&hdev->dev, data,
			      sensor_hub_finalize_pending_fn);

With that, moving the lock into the callback looks right to me: k_lock
is a plain spinlock, so it shouldn't nest inside data->lock, which
sensor_hub_raw_event() takes from interrupt context.

Could you send a v2 with that change, and say whether the syzbot
reproducer runs clean with it?

Thanks,
Arnav

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795512577;
	b=rzW0ABon4dUsGmaVnibzZ5znvcCa8YDkVlzctm00KWgUU+qbukFWfJj2A70GBssfmHRi
	 5XOyic+BkwuYSspKiV6vurlAvEuox8FcZYrZ7Q3j7IyKuAy8AyYgHgmQvA21kdltBlQt8
	 CTuUoQ4bgkqklUM8CwJfD8ir0UIDs85lRa9pTu4NrasSavK37pu+VwaYT2sYR/8Kk1Cac
	 iLUZL+7msEacg+lbobY8WEOgcsFYDwKRAM13cdHaVv1MTB9LoS3jFQa7lZ0P4xIH5plyi
	 4tWToRfk+g47jBMhe+/h5oZU52LExkZLXaTP2A9Ad8wM8sZFPQhVjJ92xrNnZkhtxAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ak06+rRtQsPupbgxyIs6n4VqFtz0XTJF75o2FEFeOXg=;
	b=e/Qi5gupJc0AFY7XAIWBiZaNpyjA6yraX2yFRZ9M6ksrf2PpTJKUUzOqWSTIkVKdxKew
	 mS4VRpzJpWl+Ewra5S9sGMYFvUcbHw+TYqPe/OMX4gofAkxdyTRKtNszLqE2F1vPNQA71
	 wnh6RY2O7l+X9eEcqcHiR0nChURLyhgCcmEVBtudki5jA3e2MVGvqWY3V4tMhzhn0nr46
	 2+XPmLHXukKKcR4l2dBfUXFhFHB1tDCgHRvcVwv+7Hm9+PA21sEIPRJ1+7hKSOh/sJnOv
	 KnYY67Cd+DYQwYFXEciq772+cF9pl4nDR+4eMDbsSDFGBrM1Dka6+sqgiSCs4IR0HFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crusoe.ai;
	spf=pass smtp.mailfrom=crusoe.ai;
	dkim=pass header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b="Z9I0/3Ye";
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A9C606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38A9C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=Z9I0/3Ye
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33fb4680717so11378522eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1795512576; x=1796117376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ak06+rRtQsPupbgxyIs6n4VqFtz0XTJF75o2FEFeOXg=;
        b=Z9I0/3YeG5bj89ZQoL/adT7pXrWzvzzYKSsWDDJuS/CSBYwhJVw5T2Q2InadazD3tn
         ZA1tdk4wUDMb2xUeFg+LJ3qMhpgGE+rhXM+GaBn4DeEQxnWaiFJOAq0/Gz7Dj5YmbGJo
         U0naIVPsVFS+dpcNMgyZLYaZ/83/djQYIRVRWBbIPAM+JjrC/sQDmYC71vZxOoCIE6Lp
         6dScOKxneJ1jaQraCi68b70NqmPYO37JTy2IAi+1bV1JJQ/dNa87IT0lfjk7HCGpRaii
         UurRUUdkdxBNZG8fF7Aos2pfuE808zNeYSXRFF60Ey+meFpg0EbKVJBKh4f6mH4RFid/
         4e9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795512576; x=1796117376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ak06+rRtQsPupbgxyIs6n4VqFtz0XTJF75o2FEFeOXg=;
        b=KRWPqlhZmUOZyrFcPucwR9gfylnURXTcsOx6KoNqsDxV57RemEUDL9jFKAD4OvHZXq
         EkzPMY54a2d4bLSZ8YdiWSV5P4YRzvEakBXwEEExcIu8gLKz1rbSRW5AgLgXbUa4+5DX
         rEaF0H+DCJX0BK/VKZZ3iMrxFa+r3yf82I3SSP0aT24aWXBnS0BeM17XKxLd1HkFZhXn
         SEYU3UHu0YeE6aJ92qZqVsQJv35/0eY5D1zmDyOKrlpE1uOhxQBfoO3UVMUn7M/86mPP
         KAwbGc/q0jhd57TCG1iNyjYdV4a95mLPwB01OkdyWHD99LLUNsr/xGAzl9Xb1b/f3Fdo
         RQXg==
X-Forwarded-Encrypted: i=1; AL+hErGsw4uVk7XWDsRib0uc/Pb8Noc6jSxSdUlavbfjbYuSFmRmJz1dgmkc8TNUVmizl5LBz4IRWAdjdLqfyjc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fTiGqT0yO/BVdzchGJqQjZSRZZBHQcgJ+EiPMiUrnWpcAAosd
	3WW759QPRD1Jf6QB6qudpkVyVUIykGQt7lk2tj8awWUuTYPeeNSbJi3VypbdXxaiWwUdXgT20pD
	SigwCGPga0g==
X-Gm-Gg: AZFdTZd8h3vDDE1129bGka3lRTBTExURiZ4g1mvh18Rd6J8C7Aze9nMmJ7xQbNCVgsQ
	83bijlkPdhbHHR8QGcPuqj3P7Rm4Go48s3hRSqh1oTrMQ8o0p0SX7bYUCDHlumgVgOCDzXwcTt2
	TSU3ws9ONU8E/5YkfvukYyY6EG7TaBTSDvYVEuZP6/OQnaD66fKFci2fH/eUpX+snu6VJde5Tme
	XWTU4MxREMTVxIjwxrx4qacE1QI16bzyxXjpq4hqBqvMUy4EUJAX7DF+V4KJn8bjSPLyGPOkn+z
	Qo/X27ZK8wsV/JtOlXTJj5aW9I8Lqp89eU2GviMJS5KhIOljZHlBVZmK+t3Lypddk35CyKGgcVt
	0u57qQzCEe80XmCrhD4MavMSFqgt6GUNvdht/6i6j9u2lsGVR1CuJNwj9m8lX5xIof9SwjacUSW
	uGaZNybqOWW0Fla18wPynZT5bkoZef8T8KUJm/o8iybRn7gLydZGF8HufatPpNxOp2/+xyR/hGQ
	3nhs7OgGS0gyM4lngmadazpAUquQJgSgXwbfMMcmC/Sx9gOqa4CH9VaC5zem+TI6rRg95Gx9Om0
	BmpS55jAwKPrW2TzWTf303WF4YUuX4DTmry7jw8bM6dxSn/2XjbIxyPyzYlVYMvpCc8eqXK6CeO
	hL+b3ejnlhV87AV8viAg=
X-Received: by 2002:a05:7301:1a84:b0:386:abfb:4a2 with SMTP id 5a478bee46e88-386abfb1a83mr6976322eec.11.1795512576085;
        Tue, 24 Nov 2026 01:29:36 -0800 (PST)
Received: from MBP-Saravanan-D.civet-hops.ts.net ([71.202.170.54])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm54229158eec.5.2026.11.24.01.29.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 01:29:35 -0800 (PST)
From: Saravanan D <saravanand@crusoe.ai>
To: Daniel Wagner <dwagner@suse.de>
Cc: Saravanan D <saravanand@crusoe.ai>,
	Hannes Reinecke <hare@suse.de>,
	linux-nvme@lists.infradead.org,
	kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me,
	axboe@kernel.dk,
	nilay@linux.ibm.com,
	sgogte@purestorage.com,
	hare@kernel.org,
	linux-kernel@vger.kernel.org,
	iyamahata@crusoe.ai,
	kiyer@crusoe.ai,
	ganbalagane@crusoe.ai,
	sjpark@crusoe.ai,
	bchen@crusoe.ai
Subject: Re: [PATCH v5 2/2] nvme-tcp: allow setting per-queue io_cpu through sysfs
Date: Tue, 24 Nov 2026 01:29:10 -0800
Message-ID: <20261124092915.90075-1-saravanand@crusoe.ai>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <79b5a23a-5ecf-4e96-85c8-031b5eca2867@flourine.local>
References: <20261018010059.83120-1-saravanand@crusoe.ai> <20261018010059.83120-3-saravanand@crusoe.ai> <0ee4d281-61b4-458e-92c6-7fff3e50c0ec@flourine.local> <72fce5bb-b256-42aa-8844-f970c4480ad3@suse.de> <79b5a23a-5ecf-4e96-85c8-031b5eca2867@flourine.local>
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

On Wed, Oct 21, 2026 at 10:19:37AM +0200, Daniel Wagner wrote:
> However, to make this truly user-friendly, I think nvme-cli should be
> extended so it is aware of this and can configure it directly. I've
> merged Nilay's --nr-io-queues patches, so this is the natural next
> feature nvme-cli should support; see commit:
>
> e170d6985797 ("news: document the use of --nr-io-queues during nvme connect")

Hi Daniel,

Now that Keith has queued v8 for 7.5, I have started on the nvme-cli
support and I would like to get alignment on the command shape.

To show the values, I plan to have show-topology and its JSON output
list io_cpu and managed for each queue of a TCP controller, next to
the existing per controller fields such as NUMANode and Reconnects.

Setting io_cpu cannot follow --nr-io-queues as a connect option,
because the kernel only exposes it in sysfs once the queues exist. As
far as I can tell no nvme-cli command writes a kernel sysfs attribute
today, and the only writes are the vendor defaults libnvme applies
after a connect. So I am proposing a new command

  nvme set-io-cpu <ctrl> --qid=<qid> --cpu=<cpu>

backed by a libnvme call that reads and writes queues/<qid>/io_cpu.
When privilege separation is in use, the helper's handle_set_attr()
would gain an io_cpu case that only accepts a valid controller name, a
numeric qid and a cpu number or -1, alongside ctrl_loss_tmo and
iopolicy.

Would you prefer a different name or home for this, for example a more
general command for setting controller attributes?

I can post the series as soon as we agree on the command. If you
would rather wait for the kernel patches to land in Linus's tree, I
will hold it until then.

Thanks,
Saravanan D.

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174875;
	b=4cLaOmTOgUYhuSageNn+friSvT9hrVHaiTkf4WZJzRr9fqn5gYJnTcnDDZVCb/JzbYbO
	 1VdkluQuKhSMHxLnJ6TXA+SayuMEPYVRvHfzI5Prm1tM6/wmkX8uu6tDVvTLp/ZTQ8Xc8
	 i4TMdP7Xpnyr44IkVFBaBccZCFVv/GBRQSKyQ7azjF6J3JP1khOCZfuu9aYHMeEZcy+wY
	 +pepevaszTY+7ChvVV0DgLnkaP9260CY0TuNJUeby8QnizjAcav0w5B89JmMPsijn+cjl
	 0lf42JPpnRXyx5npgsYrkpogYwnpq2ssZgIHWZwBOfwKe0pE74/c0ibJbvnAanGzQSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=8CwPJKjV6kCIIzcblemdluBfnd2QRRX74DnK0ggRw68=;
	b=PFfNSXKhqgHvQoyf7kKW3Rw5fLZ0Urs1pOtpmJGbYPRhBln4eH5QbG27Rh0JPTcYPGCf
	 vP3HCsa4cFvjk8ccqY1KO6SJ7ns9FT9TGp4sqqLIruW0GCQgFxK8di5sbXrcT4mYTBHub
	 fC2CgBhf7jTpX9DA/+ipnnmwbuyZ4MtEb+fW58DJ25aT22cuwn5OasDjh4tS70ofYXlyP
	 NUhv/k5979onyQNe43A5sfvVMscW4nwdorQt16SS3L5iBJWWfpjyqOc7kXcyDcBX0ajzS
	 aZoUMaFBtgBdvOBajtZRh2sC31EwxfmH7V/2PLAdvH/NvGj0wIiU0nJdyZtg3kf3eiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=T+q7QWH4;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E54A606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E54A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=T+q7QWH4
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc147d86bebso451059a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174875; x=1795779675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8CwPJKjV6kCIIzcblemdluBfnd2QRRX74DnK0ggRw68=;
        b=T+q7QWH4CwDRmAMjxVuYKwoDHVnOWgOKxBKRvqw3xB1wacFuxx/+Eshd2otJ9S1vIW
         HqBrAyjdiDA4an8Tyhu3etEu546IyUmqhc5L2N2bMrKbW+h2dyk5kIVNvveE3+rklaDh
         W76WW/RzEtqeB3V4eKTQ+ko0vh+JJOSJy1PeeyG3lgAGshimY48LPpiJ82xzxmTmNlqA
         34QqIGS2HegNP+hZmdtl5EsGsEM+YZOo2HyMAXVjLFJ8nn4hJnVhGZHsmXNVF0HDGb47
         fayNpBFbP4V7R5WeklzQYVI7udmhahxcY357jKBBsV6A24tNEz9wEM7V1zVRW2QvNQj5
         JVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174875; x=1795779675;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8CwPJKjV6kCIIzcblemdluBfnd2QRRX74DnK0ggRw68=;
        b=qi+14e/HaariKQVuLF9Vg/oregD4hJqF5Mtw8yo5tE08nmVLZtK9IPVQdxZWrHR2Om
         5GpUWJFZGMCLePwF2DStI9CC/PdGnz7RGhN5CHl6UxulPsLGK9Kd/3N1JBivkdNX+WV2
         8PzVCo6xNfw0QqeMKJ4bLRejX5fcCmdkoNtPfmrnfQONniV3qPSwQC5ovfwQwBwlThqV
         hcp7PdkFKI4bR4Ndi3Z9LAeYe1+4SXDEWRXoOw94CKk/jMi/J2SPAHU3Te77vActiA+S
         MrHrY8SF+gPgfUNPKFaGyQLOa7T2FNHCnKkZKdzTPR1ZPyZPJYjwXuGT4rrOx6p4G21C
         784A==
X-Forwarded-Encrypted: i=1; AL+hErFImJl0VakvWZN4YiW71HBKziRsWQpJhL5x2lPQEgKMZHXpisqMh+xmQpDpV7vYeuexFwxYxZMdX7jtXAI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8haphB2MTkfpiZ33kon6I4dC1+PN4dOev6uoUs0bcu8v6UQ9WW
	whqcIOX4zN3fGxCl7theIFn92D4oo86EG7zp/dR4JBK7HWq1kLnFx7wXKqE8C0kScEw=
X-Gm-Gg: AZFdTZcVPax0LWA8PggYifVoyqd6l/1IWq7hLszlHjiYpwlI4eZe60lSbip6EcZ71Aj
	alUpPw+lnvnOvioJOnAAJGxCoDFKXXROaulJfSCkdQXHACaC262I6o7g2DUo95RiHQKiCQUFmw7
	3AlpWl+uXQGEJfZauBk86YLCJo8yWBBPPfWSKGshFnT5WBGZsBxyZHEn7ujQXLrEJ20XBusuAnX
	N1i7jYTwF3pgFw2GEw1v+fMr2q+xfzCA4I6i+cCM0vhkQlaHf3xFvpfMWhYQwNj/kGSD8vyfFqz
	Z8Bj1QO/GU9QtYG2OHf1DboSZ8BuGkxl6QNMdGBcANG80tvp1pSAArzmjL1kvUSMnIA34rucsQQ
	47cmJdBV3f8j7CNLArlGz/lkWdZXgOU5V4Slqg7GG9EKC7g2KAmqUC+wEj/VdoMFhppwFHlPhmA
	WjqP2dl4lsrAqImPpVwmPgO1M7yiGEmXTl+Fy3szCl6j47jEoTd/Jh2pzZPo/OIMq9LsDbXXcVm
	01yIll2d1wWZHaUGwH4YhQ3A2JvzIsIQgM6Dko7N+PWSKB+y6FmLn0LbYlaJ5rwmUSAmYFnZJl4
	NkPYjrlErwAZsq0vKDuXx50/1jmv9yu1icMLoyvBZRaq4xp19dwOO6pZx03V2hx5UMRX9lks//9
	fk4NDUU0+Zt+eqWijmWFStVVE1A9kVM5PJ60v
X-Received: by 2002:a17:90b:3e48:b0:3ab:55de:e089 with SMTP id 98e67ed59e1d1-3b40a611fbfmr3110569a91.40.1795174874780;
        Fri, 20 Nov 2026 03:41:14 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm4125523a91.2.2026.11.20.03.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:41:14 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lgs201920130244@gmail.com
Subject: Re: [PATCH] usb: gadget: f_tcm: put the overlapped command's request back on ep_cmd
Date: Fri, 20 Nov 2026 20:41:08 +0900
Message-ID: <20261120114108.3071955-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-223285@kernel.org>
References: <20261119140641.2768465-1-yhlee@isslab.korea.ac.kr> <sashiko-outbox-223285@kernel.org>
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

Right, this is a real bug, but it needs a non-default setup.  With
emulate_tas at its default of 1 the core sends TASK ABORTED instead of
calling .aborted_task(), and a BOT session can't send a TMF itself.  So
it takes a LUN RESET from a second fabric sharing the backstore, with
emulate_tas set to 0.  It's an Oops in the target_completion worker, not
a panic.

Fixed in a separate patch:
  https://lore.kernel.org/all/20261120113956.3071640-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee

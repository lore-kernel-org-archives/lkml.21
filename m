Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795073185;
	b=MYpORkjiY0V3Tg6pZrtuBUXWaGWiMF6ICGi0vRWtad9Uix4+MDGpX9sEIe7B2EQFrqIe
	 RDrcf7UjSlNsLVs4tIBs8gxRl0lW0YfPWM77kx+BNloIyzvt9EW9Zu+tsHV7Es56/NYpt
	 wP/8TTGsV3I7J4I1pIRapIZFe8zBiwxJ8F6F8lHPAUalD6Mz5euvJ23Jv+8v8NN9hqOTR
	 kzDBLdmHaXU52dhNMqoh0OpLkrNFP7p/QWtbjjyXZ/qYi6656Io8iOu/2uEF2q028jgbd
	 pNqLVnnLN6NXvOppu8bS3cXpISX6NtWGw4kHH3FJTuESII65nlKqqV5Y/FnXtbOAKOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073185;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition:X-Mutt-Fcc;
	bh=3j6KmbtXLvsmTJiTThzFS5hiEYdNxo/Fgv8rfbB+Ypg=;
	b=pT9+DQwh+7xrdOiXqvWgjcr/3ojEOWwpweMedeR7lNqwu6z8KTA3do3J/d+EF75NlS4f
	 bg2dpf+DxWEQZsw57Q2JoOwazFKQlYgBiIEpv8ffaPCMCPnxLjODYU+k4D7DxDyerrIq0
	 UHE5cQxY2yxWxSHAvBZ+9wC9LbTh0hDu6dBypLxcVfONnPYxiXzpnNUOoux0P9JHY2ZXY
	 ncc8MgrAkOXOukOh84VIjX+2NaOYfN4uMuWjVNiIWTUsXKCTzHGDESBaacROfhm7VkgX2
	 +PPo7KikyVsjhgRG2tF5KPLg64SqnqJIClqis3JoAYp3i8q3AcMA0VDrEWqzesO41oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PxrjOnAy;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=F7rRIAyt;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C436160A2600
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C436160A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PxrjOnAy;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=F7rRIAyt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795073184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=3j6KmbtXLvsmTJiTThzFS5hiEYdNxo/Fgv8rfbB+Ypg=;
	b=PxrjOnAyHSZ/VytdysCEJ+Bzbpy66p1zYlOwtLMAZxCizeJ0dp3VgNaxtAn6XNW0Nvn+Rm
	rDHCLF9OSK44SU9du4FuARU7RoSqextWWZB1O7ttxXvwRmakIExcq20/bf8Us0IL0URKst
	HX+GCGcXWF7346CnOfYnRCnHC3JR7v4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-O4H2-OWpP8ilyBuBf_ur5g-1; Thu, 19 Nov 2026 02:26:20 -0500
X-MC-Unique: O4H2-OWpP8ilyBuBf_ur5g-1
X-Mimecast-MFC-AGG-ID: O4H2-OWpP8ilyBuBf_ur5g_1795073179
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-49205554e17so1234353f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795073179; x=1795677979; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3j6KmbtXLvsmTJiTThzFS5hiEYdNxo/Fgv8rfbB+Ypg=;
        b=F7rRIAyt3wWCkr/uIq7CcsZAeA9N2ckYQaSb9PfrHzzdrhLoatK0jPKUtp+a7bx4zw
         Ke1VCtmj7C1COq4SH1DMhKo2Ccl9K7tOI42jExCQFi7YHv1F+j0DeQnYLHFOJllMVk5T
         t2Hal6qIZufy2ggOPnNvB12f4qax7PvUPO5vOts5DVv1q8s8jnGomTr9maN07NLHj81v
         GsL59um+fiT/322vCvC1fsnbBl1QmFpLuvWWvkOEpUPm4fWEQ51aFMUTyFQ7v0lGn2U6
         ZCM/9e2zx93L7vZkG4kMo77jDjMqrJlJiTu6EWtXGU/v1melySXVeVmdbJPyQnN6s+gP
         LWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795073179; x=1795677979;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3j6KmbtXLvsmTJiTThzFS5hiEYdNxo/Fgv8rfbB+Ypg=;
        b=qGNF50BL+qGogwZNvddu6jC3S7hpoj5F97z2FTJ6P2fm0NQLUOA6Ynp6o9vnZ2RtU7
         JGQAKoHzUvYmp4JfqZy7nZ7b4bCjKK3twcl2MIqSUtRhVCflQkF9JPiBIDYwwcEDFb54
         wsPk8l8O2I/fQSMd2a3dOfvCT6sbRjQygMyV7e/Nzvl9ywdRIBUSNYpkb78Shnwp+5AS
         UcQWLAwyEXyIFpldjrJvw0afME7WBddVuuNY0bsbF9hd4gFQerwEGsPrfDV7KsgtkN7v
         At8kphegMrRmkxSQ47rd09/GcV49hYO8phIKV/StuUJaI/fyZPk7DUdH4D4NOR5P/70K
         HGaA==
X-Forwarded-Encrypted: i=1; AL+hErEHIiotcFutdmqWOiGdFgX6ep+wg1ZYESBzRjDBGYJxfDZtJ+iGqbiAhze7HcpXSEC222ZN9c8LO4fvYsQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1zSgWmxDfKDE22G6kRfqcrAEV3vwgJnTULZyYhskCcxr/DWaL
	hcsZjR56kbmoWt69v3yL2B6lp/9ajPdQSuZanI8NdVQTWj2hG4YT0mMP8EmFiXR3UbmfLx3WTjV
	tUIH8uc3kmdhLQZdRLqWnLC9eavKwCqgN8KTYlowkHSTxrhp2LX+uLJo+w3iOiOFmPw==
X-Gm-Gg: AZFdTZfRx38E6VIXOCVxhQ3zmVZPI4xOR/7h7KLwSPO3KXCQgSD0WfZMnHXu8AvM3tO
	8wOcJoC8Ed6F/K9CuQcpwhOPCpaCzjRv0guOVc7AgL7oMahK8gVZIyOcJCv1LLRZ/geA5BSUpLW
	tOwNKBnMDlbdgBQzLTuJtLU/cxLXn0plB8XMmCroGXAvFWIm0hgtq3Kdmr/+z32F/DhXxLoB1nS
	N44orqwten8hVHDj4I/ufUQK4ZMDPo+1z+6X1wBF7ytaHe4wgyMJTXsR1owmjIfObwXc+5oiEcc
	Sy7YCPBILL9mQ9BqJADt2c/cJsiAdUKHLmmmUnkmy/EV9uVVBFtAdOWVeGDeNAvkXvpj+TkoFqt
	9HDPvY7fD5R28SrR5XrkoLBsxSjwTa0IW8NwM6gnkXEA=
X-Received: by 2002:a05:6000:4703:b0:4a6:4f35:336b with SMTP id ffacd0b85a97d-4a64f353379mr8871398f8f.5.1795073178848;
        Wed, 18 Nov 2026 23:26:18 -0800 (PST)
X-Received: by 2002:a05:6000:4703:b0:4a6:4f35:336b with SMTP id ffacd0b85a97d-4a64f353379mr8871351f8f.5.1795073178254;
        Wed, 18 Nov 2026 23:26:18 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1520:4400:d78d:7b2d:2f5d:e08f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65541f3f7sm9540259f8f.24.2026.11.18.23.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 23:26:17 -0800 (PST)
Date: Thu, 19 Nov 2026 02:26:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	bioloidgp@gmail.com, jasowangio@gmail.com, minki@morningstarsec.dev,
	mst@redhat.com, stable@vger.kernel.org
Subject: [GIT PULL] vhost: bugfix
Message-ID: <20261119022615-mutt-send-email-mst@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mutt-Fcc: =sent

The following changes since commit 1a577f9402c1780cc1e663f48d5dd54c02051b09:

  virtio_pci: don't take the MSI mutex under cpu_hotplug_lock (2026-11-03 07:32:14 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

for you to fetch changes up to 5570a998b884c988dbe105430d7e2d8e9411e37e:

  vhost: split out-of-order used ring batches at every wrap (2026-11-12 07:44:36 -0500)

----------------------------------------------------------------
vhost: bugfix

One bugfix here. I am testing a couple more

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Michael S. Tsirkin (1):
      vhost: split out-of-order used ring batches at every wrap

 drivers/vhost/vhost.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)


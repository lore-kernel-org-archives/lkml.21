Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795046743;
	b=VsNNgPuD/E+3bVWbHYidAGUZNnKUBUOJqJ/x98IL0wkYbKt3LWfJ4cYnN304UugB6vvY
	 EvBt4iybcQsZf2DdX+YcH9jcnQ6qvO/SpHXz0b+moE8qupjnnJZuZ3KEk/yALj2eJtLCa
	 OmUz8Y3Mw2e2RxkDXwTcV93KRdDE5IRdRe0oSdr/YxfslF/sUj9Kxk+gZ6IKzwWCJ8Wtc
	 FTNm8X6ZmTCvNojTsdYiSXXumAXYnXLqqlfS3LFPGJLoNsuRU5SfrPh35AutSvSdH3PB7
	 uNeaav8SFg7iqdKjWHKnyfJG7Wr0uw9HCDgk1gQl7xQ5HbirJuOJa3hTsc1Gsio1KIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046743;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Date:From:To:Subject:
	 Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 X-Scanned-By;
	bh=3ZLR5Xm0QEt+rShTQLBvnsAfT6oRZ1fJCpUNYLZ7EAQ=;
	b=cR8gp4VxRDIdYPV2h32rmF/FST6Ml8LWXe/F539hEa8HRvEGNNa50rxoKAcB5W25TdaM
	 3IxIXjrAirEYQcgkVv+F2fVSBAMa/Ty4zY07PlHYS4HvRtq5HpU8F9XpXlL0/nNX/yO8R
	 yt1X8iGKFWgt7Bewpfmp9i56mHujeTj2eFRQ5PGRGT7ZdMPmE1B7xx5BV/PqcQb3xngse
	 TvJY1p+3rXpd5cP2Vq8bbItOl1XEhYoDO01XqByV3RE7Tus/rNTw7FKEVKu0vW+jM9mjr
	 k48sXU5bvk+H0LeC5TRCUhBftf+XynnIBh8L4L7ZhuK46mHcPMXmL5z1lYeA4uLTciw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f64LOTlq;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F4F606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77F4F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f64LOTlq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795046741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=3ZLR5Xm0QEt+rShTQLBvnsAfT6oRZ1fJCpUNYLZ7EAQ=;
	b=f64LOTlqT9OHCbe0c3dsuASMB3lv9P55lPxfkAxRa01ReQUVjhmaxyvsGaWjj38niYs9fb
	VtrELSYxn2ntJKK454VrpGUxuHbDoA3W7NNovyKmq12riXSmsNQVvZfaN1j0z1Oeo1nc7+
	fnlQtsnm9j/itI5jzjj2lR6Ni38I+gQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-477-ZUVCGgeAPZewB0HbaIFCtQ-1; Wed,
 18 Nov 2026 19:05:38 -0500
X-MC-Unique: ZUVCGgeAPZewB0HbaIFCtQ-1
X-Mimecast-MFC-AGG-ID: ZUVCGgeAPZewB0HbaIFCtQ_1795046736
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C4E531955F7A;
	Thu, 19 Nov 2026 00:05:35 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AFF6441F;
	Thu, 19 Nov 2026 00:05:34 +0000 (UTC)
Date: Wed, 18 Nov 2026 21:05:33 -0300
From: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To: Joseph Salisbury <jsalisbury@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-rt-users <linux-rt-users@vger.kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Carsten Emde <C.Emde@osadl.org>, John Kacur <jkacur@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Daniel Wagner <daniel.wagner@suse.com>,
	Clark Williams <williams@redhat.com>, Pavel Machek <pavel@denx.de>,
	Joseph Salisbury <josephtsalisbury@gmail.com>,
	Luis Goncalves <lgoncalv@redhat.com>
Subject: [ANNOUNCE] 5.15.225-rt107
Message-ID: <av49TSuHbtteaepq@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Hello RT-list!

I'm pleased to announce the 5.15.225-rt107 stable release.

This release is just an update to the new stable 5.15.225 version and
no RT-specific changes have been made.

You can get this release via the git tree at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git

  branch: v5.15-rt
  Head SHA1: f3d59c0fe6c62c4f6cfe7ab67318dcbcae56af18

Or to build 5.15.225-rt107 directly, the following patches should be applied:

  https://www.kernel.org/pub/linux/kernel/v5.x/linux-5.15.tar.xz

  https://www.kernel.org/pub/linux/kernel/v5.x/patch-5.15.225.xz

  https://www.kernel.org/pub/linux/kernel/projects/rt/5.15/older/patch-5.15.225-rt107.patch.xz

This release has been tested under KernelCI as:

  https://dashboard.kernelci.org/tree/stable-rt/v5.15-rt-next/v5.15.225-rt107-rc1

Signing key fingerprint:

  9354 0649 9972 8D31 D464  D140 F394 A423 F8E6 7C26

All keys used for the above files and repositories can be found on the
following git repository:

   git://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git

Enjoy!
Luis


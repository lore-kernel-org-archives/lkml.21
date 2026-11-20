Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174349;
	b=xbuPpdX04xXjVrRtVJmT0vp6teMbPkTBP3yU2qa88pGwGNsOGPKnh3/+RGRpfxYcjCNY
	 w2TnB/AghPXl+uJToUDEA2IrKvfygI9s2bxX2f+ujo2IC8IXUSr61SsV1v+ZEBdUx3AkJ
	 u/LcnTeDORFWB7hPRb6UQJKuTT/xEpMaJ10+e6sGZTms6tW57ooN9d8djS5ZWefs9ILC2
	 1wIXXluLQSTzYCOJs9aKGxErhSPdmP5IFxeESQkoQjFnGfzjCvQRjoykYP2lolk23AEUm
	 8Pd2tOrQ6Tm4b65lpLvtX7z5lTxjXmtZ9ZbyTJVr5M8DFUPs3plpUV6dLymky3DSnuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=oT+e5zei8W9zq6B7ygBEpfry0rHVJnLOEe7Dp9Xm5iQ=;
	b=Vb+vnIBG+PqL1PqVuzpWRe4cWXuA1+m0O8ryRU9exW7WXz9GQ/Vjmtb3kawvwyp+QKdk
	 IX6+BknPipaiazE6YeOfJT+vKC65G0vk97pObVHnO26a/i7jVvHijs3uh8xAkVJxw+GS6
	 NpKpIgIG/kHY4vqftPYeUQSSmv/IQMW54W/XKwBcPnIPYZm/JTfj1MMCPS1VQcecG8tU3
	 QQpbmVO71c3EEWB/W/PAVBG+LJfoW09O88TXVY9Qy4YEbwZ02jOtttn3QTdqYPiDFjVa+
	 qChbo9GVFOYil04DZr8RFYmtXhb82cxymBWIQAPaA/1hCwgp5xOap4iqDBB13I0m9HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=I9l4jCPO;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE7460A2605
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDE7460A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=I9l4jCPO
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f052ae3c86so374465ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174348; x=1795779148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oT+e5zei8W9zq6B7ygBEpfry0rHVJnLOEe7Dp9Xm5iQ=;
        b=I9l4jCPOg3s4jnVn9JbxVQCPLY1V+MobJ680af7AuZNKjBk7eA+YRPaAmB0yhXoIxt
         QQshzrzYHQxrDTuo3Djua4arc8Ha5nzzoI9DqFHylBe4TCKxUrxw95NYujJqZ3VaVdvU
         HqWkktDJYS0t8LUWSAwoGr788QxKfFP8QbL2Q7J9GjDUw4TEP6ujqaszk2kX1t1uLX1E
         RbvkE/tRieqOPy+0g+N0cRXhlgrn2OysQYcibsg2RSw1qIdlgTq8g5LpnKJd4v7WU4CW
         Um5HyrcfKKBAuRZHXk4qj+Ytvcrmp5oLyuygUYLwr/XzoqW6xbC0x0oZvBJo/8+fXKig
         c7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174348; x=1795779148;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oT+e5zei8W9zq6B7ygBEpfry0rHVJnLOEe7Dp9Xm5iQ=;
        b=YhoKRo83KVZ1rZWcy1mDT9O3XX2cBsmBXCvxUWqD+mK64lJHkHYO0RtKeDkcZzX1Ln
         2cstkYPnTuj29R8EmIF8JP9SFNK7saT94rhVJ69wmZhI9hpUocHSXXz9WVF8mCLs5H5l
         dD8R6zlwU9OexxTWCQd8QpJhhgbaFNzrJv9pDG4mDlDvDeDMyYNqFkKeRbfc0CDtHafn
         TB5sO55hcxhQ3RFr0orj826FHLrHMXEXHeBVnMSsWEttUaU8WjDi8S04D8HeXFlvUESm
         ow0iFgLuvWzl2rV877QIWFQ+CWP7ra959kHDzgEP/BV5srY/D+dh6QpYSwvO7IsJd22q
         4WKQ==
X-Forwarded-Encrypted: i=1; AL+hErHG/dasbi+lYRrQithvOYTk+4J+/I6NzNp9rE1FNtvCxaI0Gk2sK+E3W1a2nY66cLyAjOE4uvwBa+vAZYM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pUshDG97vpai3g+nKmSFriBf7/4hxfwFXqi/w3auS8jr7lGve
	vDsg8rBvePtSkQtEK8T5Rbxh+TgbTX+gw5qNIUfHFUEvpUp1APLhd0iE5VNZf/CLsb4=
X-Gm-Gg: AZFdTZfTgzcjE4reKSACZNB9n/3fMwEedrFavNgd/TRooAKyTyup6lg3pIkJqkpl2Rz
	VPvx4WAiQUEQP5Gnis8FOeYo9e67E/au4Vr7zro1dsj8k8QSh2ESbrvHHewnDQBZTNAqB9g8Qvr
	6tlgOUVIWsBOF01UEViw0hQBJG5P8w5nMWkGFtweTDa7DwoIvpOvndu+nnx0eAz2ThGZ4c/1YW+
	Cna1qM0kMO2nELscrdi10rjIMG/w6Yot6wxlc+J5V//7Ve4HDAPMhzPm41BD7V7mwRpO6w/k1t0
	HTYhojaTYbi27C7KRH7n7sIF9H9srcPGaF+288iddt9OW5RpTh+hidNnTsjbXyBqA9qaP5Llqtt
	HYI+k27a0nlWm23m86egTAtJL109cFQONjQcY3cN6MdycwHgSL9arAhM+9vEV4V5WV6GbKDBIwA
	eE3RJmjClAu2p5r0Z2Ax9ubOdgqhKtJK4KpFMAmVNeWYvVL42sJ/ABhkkdyYzv0JDZMPR/UJ+U1
	QDkPvlPku4OKvY5OKtVcbTCc42WtLJrI4s/fBAdTwD6C6w0VKUqiWms9c2tqUltqqDDeStKTVaj
	/ine3Z5cixwTyiSIG8Sflnss8eV1Zh1N7eUOOGfnPPyN1K+59ZDDFmpBLpGly/0O2y7N6HaqHFq
	1OkueU3wHkGeRjX0HKyhtsI3T8mm+0cNAm7ro
X-Received: by 2002:a17:902:e741:b0:2e9:d0fd:639c with SMTP id d9443c01a7336-2f03f1ea747mr29262845ad.55.1795174348092;
        Fri, 20 Nov 2026 03:32:28 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee848c1sm13247705ad.10.2026.11.20.03.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:32:27 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: nkapron@google.com,
	Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benquike@gmail.com,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 4/4] usb: gadget: f_tcm: clear the scatter list when reusing the BOT status request
Date: Fri, 20 Nov 2026 20:32:17 +0900
Message-ID: <20261120113217.3063855-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026112046-thirstily-cosmetics-1aca@gregkh>
References: <20261118124005.2428068-1-yhlee@isslab.korea.ac.kr> <20261118124005.2428068-5-yhlee@isslab.korea.ac.kr> <2026112046-thirstily-cosmetics-1aca@gregkh>
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

On Fri, Nov 20, 2026 at 11:55:56AM +0100, Greg KH wrote:
> On Wed, Nov 18, 2026 at 09:40:05PM +0900, Yehyeong Lee wrote:
> > A test module that stands in for the controller's queue path, so that it
> > dereferences req->sg the way an sg-capable UDC would, reports a KASAN
> > slab-use-after-free on the freed entry for a read command followed by a
> > rejected command that reuses bot_req_in: 20 runs out of 20 without this
> > patch and 0 out of 20 with it.  A normal sg read still queues its own
> > scatter list.
> 
> Why is this paragraph here?  What does it mean?

Sorry, that is how I tested it.  dummy_hcd doesn't do sg, so I used a
small test module in place of the UDC to hit the stale req->sg.  It
doesn't belong in the changelog, I'll drop it in v9.

Best regards,
Yehyeong Lee

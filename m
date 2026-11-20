Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795157758;
	b=iWDlf7Qlz+ImMt0cZv5xw2fZc0e2VHcEeFuEMYVKmiSoT+yZMZhISISzVqOPej15C/BQ
	 q6f9X5vUVnfA/aR3Ey2J+azmcyqoiJSaS7pT+FB1q2bRieet7dgQH6a61b/lqjcRpdXIe
	 6JpKIkyS6IG81BR+L8nY5rBKRLNPKsfSZKwA4KoDyLqCg7pICON6B4OiWz6JgBRugASh+
	 11/9MpAe+YogRHPzY8hTw3reY77kLKnG+NK0aa0N61oYNAY6uWPIr3DlTeyTT2F9cWiZP
	 DNfRWk4UfuKBowyzSxvahMs6nsOSEWzy56IAcvx5gW7C6MQ6RKiFd8dBrW3oStm8PeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=l8t2fkSnm8T1xxwId5w98hbT0i+iHQGrTGRNI87vf0c=;
	b=rVB0jrAqc3DzkvtdD5ZqCWMLcdvXif3OTyBBJpt9MD8u/l0hJviQM7vSHfIwy+EZz9/f
	 Al0gKWkq/ioWkFaQgNA23LDK9m0Nozzy7GZznyECzKPZWzQApg0XH1IQLAY5bdGOJKqEa
	 2e4/F1RtQlRe4/qoG+v4OZsAN59FnGVtSqkQ1sZoudizzxkhUmZnumpkmv4dwaCzkoOfK
	 kf0FQdg87cq8Na9KidQm6uFF2GYD+5Q58yGHtMnEzPUkzp55ikKMX2lyCyU1USYA26ZR5
	 d3Dw07r6Ca5EF7oZ33gtCs18tfWanCOWDgyid4G0c/rqo+ReD0QN91hs7hsdsrRyttw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wkennington.com;
	spf=none smtp.mailfrom=wkennington.com;
	dkim=pass header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gjnb5Yd+;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCC3606A33E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DCC3606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gjnb5Yd+
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f02f04a426so4376195ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795157750; x=1795762550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l8t2fkSnm8T1xxwId5w98hbT0i+iHQGrTGRNI87vf0c=;
        b=gjnb5Yd+FBjAZMga19TBDl1JiyAgrAoHimT0AS+twnuAcCOxzEmUxjGCsjLnGZlw0A
         eLeh3qf87HlcggPcnMdG1TZXli+9b3EDScQLJ98yy5Zhr0fzmQ1GXoAvGQN4cmHs2Vpa
         buyR18OS/GRaLmevVpEG3nw9jzRqQ37ZXf7sCUqFKKEJFCPmh17qeZdIq6rFBspXo2ad
         j3qec7rQBoL3gCh+Lhy7K7pgHB06fLbpX5SZenrmVfRZ2S0qe2yluB9+C+G/8s5Smegt
         CH+nnIvC6n4uyfJFCbWV1z6EatzMdlh7+ynZNIQTQM4A3pJD3ftj1h/gIwo+XlRwg3/J
         iEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795157750; x=1795762550;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l8t2fkSnm8T1xxwId5w98hbT0i+iHQGrTGRNI87vf0c=;
        b=nYA0f/P/UwG96EZAPLppQeS2xLJbn/CdPCBo6UD5iQOFN8pTl3kJN2YhBewTo/zYsg
         uLX1mlHOBaHTDFgEIvWf15/atM/bvLFUUnarRiah00BwUXO95rXKc1Io/skP2hGbkdIb
         jnsNFFlofQOwMXpS9ni5xnERblpu1I1UKc6HyArdLbH36RKcZmZsFlEQjuQPPhZr9Vgg
         pKjPsKzcth5EC+d0IRgB/faM1nWqbQjvOEXv35LIZkEl2Gqjxf4ZRjvarcefbzcBgNRz
         hShN5/XJi9z/DHHfo3KIfXNWcXxDoOQLfUtdt3DDmK6/zEw8q30Tn0XSWogwECoEOGLF
         u0pQ==
X-Forwarded-Encrypted: i=1; AL+hErG6tAaBG8fyiW72olOJeZp8GEDaRD+W7MWrw3w1MJZMT+eNTJJdFfjKtUn3I19fqp+MSiSeNTZbqgaVzlc=@vger.kernel.org
X-Gm-Message-State: APuU4Z93k4iX2eqKnDPuMv5tJEY/HZtlNn7jam8WBEYojXfbdrTgbWZc
	9ZbtgmigKAYIxOd/dzVChvii/HA0worNFgDksNqSA4jXK2He4ikjsP741n3zUbSKMhVRTR4dUBF
	VhWyh
X-Gm-Gg: AZFdTZfLPUbF58cBM7Sl7Tlkx6lz6Hk2Gkpri1cv0BTX7lfeSTk1yf4fOjBH5Iu4mfv
	M1oTTBLs6NIAVavjyqUx6F7FuikEwJCxheOB1IsBxSx7J5AW9F7h/zBriyjr3LlBai19s4M4DGJ
	DFQ7+4cPl01SflNEilBj+HPI7a0zAm1QLXlkOzIJDc4SLoM+y2uZWj4f0iouLGnqcZmA8g/zo0m
	d80GzATPpVqk9PmcvWmV2d0dDDaZf11tuhrQpgVWGARgBM5Wl+XeFiuLpdAoyB8Assop4OeKaZB
	i44SJ215WF1000EvjNk6tMM9cbBx89VkWipXwIrztVBGSY3g/1fhrqZICxFjHXw5Yw8t2c133gw
	lrlUjwzTDNuqTMTzLA9gmdzl3GnyKmGtcxPkB3qF66g6q6rxuLFUdfpk/4zKrK1d8Keom8GVCba
	82Ju0Z79WUw54alFSGYxfXlvVzhL6Nf0ABmfpcKZ3q94cP3KjhXdcgROK+wObiHBMsyw/BW7El2
	MZMQ2IYlRDRtxZMgUrvZd9CGhFNkbwqbMaapVLhyc8RCsJ/V58Q3iCMuFzopB6lugr/XdSVKopP
	D19ElsMS0CQefTJ3b9j+CE0m+xFRHFlauwMh6j4NoCST9oStnIpLYGtV7nXlE5nOlqkKDq6RfpX
	PiPRx5QeBzWFb3A==
X-Received: by 2002:a17:902:ccc9:b0:2f0:4df4:8961 with SMTP id d9443c01a7336-2f04df48c84mr843405ad.14.1795157750474;
        Thu, 19 Nov 2026 22:55:50 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f14a432sm9884785ad.75.2026.11.19.22.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 22:55:50 -0800 (PST)
From: "William A. Kennington III" <william@wkennington.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Havard Skinnemoen <hskinnemoen@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: Re: [PATCH] USB: cdc-acm: refuse writes after disconnect
Date: Fri, 20 Nov 2026 06:55:48 +0000
Message-ID: <20261120065548.940641-1-william@wkennington.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <92980914-a5f3-43fb-8bf3-714674f1b1fb@suse.com>
References: <20261118145636.3534234-1-william@wkennington.com> <92980914-a5f3-43fb-8bf3-714674f1b1fb@suse.com>
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

On Thu, Nov 19, 2026 at 09:24:51AM +0100, Oliver Neukum wrote:
> Hi,
> 
> thank you for the patch. It raises a question, though.
> It is not clear to me when you use READ_ONCE/WRITE_ONCE
> and when you touch the disconnected flag directly.

I added READ_ONCE() around the unlocked acm->disconnected and then just
added the WRITE_ONCE() for consistency. I guess the rest doesn't use it
so let me just remove both of these.

Thanks,
William

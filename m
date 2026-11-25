Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624289;
	b=ISikShPZfxUL38UyJBDY9AUuMWKGsq5/fTi4oWm5M3wLsYFygfo2l1PINdr/6eMaqNMb
	 ulacm9MxHwZbGHm50aJfyqXCZxr5iM93FD/o5DylnyhB8V+/nvBwaHn2no+e1K0doyYQe
	 alA2ovYwG9HZk6tXqn8TtQ90MBW3CAXhkU9tDEw1ZmFM00ZqGwoyA+m4O5S86itbN6Bbx
	 fRTfzSrS3czfZPzD8G55yk+KrJcGOm0sT6CBSVRBXx5GUc7qOiz0oEY1EctTTvKFMESTo
	 hy8w1HrwgsnOqjKZT05IQ0OFqj1zptb0uIzoL8bPnqWy0ny2n6T+Po3BvKrHBoM/G9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NjxkkFfQFqJqbORPS3WtzVfM2hxrb9c8ax/FBEgm1DY=;
	b=G0+EPJgLlU5ZL09zYEHYqLPetJO7cUER5GQku6xSEh/iF9ox6XT/y0/bTz3BNIdL9ulV
	 eNjE4cdVZqwfecIVPewTgEL3/ne6WBAjiwr40iUSmUAybc6xdlJx12zir17uP6mi122/I
	 /c+Ld2W7U0k3ZjWyepK1ojtYQ5uo+OrqKTGSFDKqY7djUjLEe0SsliJWpFTT8/MdYCy8E
	 kqHtL9lR0YRxq6XbOX1S6avvvu26JkfOmti3vbNv7IFU+FJOHvC4a4guXOEP/P/LOYN6l
	 Shq2IdPbjhevMqHUfpYk6MJ9tX4KhnGYOHk/dko7DpBI6UAJs2ueN4Xo4zDLA1lcUCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="p/Hhig7P";
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C533C606A685
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C533C606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p/Hhig7P
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso2852411a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795624288; x=1796229088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NjxkkFfQFqJqbORPS3WtzVfM2hxrb9c8ax/FBEgm1DY=;
        b=p/Hhig7PZFCT9Fv59nbo+wU4gcH3v0e9KqdiRfY/0ZMOqNzyBVyvyltuIttm8+a28/
         2bw4cuEpz6d0FQf9C0iW7hDPqbKk0YQMwaoisbXPgenGqtHQ6f9aPZwCT7RiRGPx3ZvK
         QQw2BdRAO0JYtCULKlbg8He5cOpXatIBWGxD9ArEaAarcaaQOdKXmW/r23PYzO/cfPnT
         00GQjzQlNwO0JjxasZ0wV7BGAdWyn95fTYhvOPGmQehS+v5YSIyxc/pYqQT/q2TnloeA
         Xck2E4BAnkkiGqXJV+ky4Cad7eegTuYenMxbjsWtebQWlXmKOr6uCNX7LrsHW6DrV/VG
         6FBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624288; x=1796229088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NjxkkFfQFqJqbORPS3WtzVfM2hxrb9c8ax/FBEgm1DY=;
        b=tGGBKyxStGPTV89aWEM0y4xhBL7coWhFhA6pLemweFF4jXEY1zWQBe9bUHv+0Y5QKL
         ouRmVI479JubtY5BaRLoLSV6mj/7921sn7Dfe+MHIl+0V1maQbAiUwQALV5fxZkTjWnH
         8mOHglLrksESFOG1goZZwYNNA72L8acZBWC68EpzP7+l9DeOHzo7cdFcdo0YgoHtym+A
         68wuC5D9oRC170rYculNqozDkjsOhG90/t4JHDKKfps7KpyUZ0GLQRZm4Xsl3wd/3kYf
         0qvayn2YQDfvcN7tHHfRTw64XoiqQ7+JGIvmL4K3M9652u4oAJYIfgxWuL9lQOEMdO/h
         M6Xw==
X-Forwarded-Encrypted: i=1; AL+hErFKWdF9Kkh1MpOl1OJn7xAMKjEz6xN09MIY/BJdK7EOzuleanqhk7dHmxocnrJ+hW1hvyb12bFvWZDIFSo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LTDFylZFVQH9a5+ObJWMsgpTkuTPd89vow25BfbbWsx7J0qfG
	iwCWLS9ngjYEsJd2QUKVw0q89NAEt0PBQ2aejJtQYwEOII9MkNS4HaG2
X-Gm-Gg: AZFdTZeoTt84sq4KesoSTmd1C+HSbtGqf3wo06AwB6T5NJVoglaqfFx1S/AhRIPeHFe
	ym6gvkIN/MzHciS2A1OV3qZkZoGmFsbUzCgeJ/3bI08haTnFgH2/TRRAhHtDTpujz69AwGa1WHr
	JFoSJMkXmVpJLdzBl+za9Wy8uPNioxXogslV/9i4z9S+iJwSYNuC3rRnilNfr/GytpQb/Nmnli6
	UyrVPspwAqQjQG2f+S8jlRLr7pMOZxaYzBWYp0rv4XaKLSQcjZeCJAg38joo9xXgnVEvpP1srIY
	APrFM22y2uyxrDZn7JEyLIZaDNq2UdB6Y1ee04+tLZSbDrA+4r6R2wGj6c22Qqakt+6+94sAMy5
	bgddoAJ8eJq/baKE4uIZprF0n2N9YocFNWG2sjcr3ATExv/GrqZ+OWLU4xbjZ1mHEz7ZyN9ihq7
	dO5TyegFBWN9zi2GmKQJ2n9eXeYftT1K2zg5OFjATzvV027M/m4UxLjZGfUm3iYNBecPVf/yHTb
	NUQNqJmY+rdx40Pcdr8qbh204ycgji1+rW0/o6u4S/UziBZ85eNO8dRpu7JEPAwr2GAg0cEBnst
	lVk0fToLNuoCT3IXqi6xW1zV9x6lpb0E+Uze7el27j3qDh7GF+93q2cynEZX0Oo84zmaqX66v5L
	mtEY3XkwRt6l3k3FBFdKD1zOv1VvoDQs=
X-Received: by 2002:a17:90b:5543:b0:3ae:8106:6074 with SMTP id 98e67ed59e1d1-3b41c8dc6ccmr16588554a91.16.1795624287733;
        Wed, 25 Nov 2026 08:31:27 -0800 (PST)
Received: from DESKTOP-TPPBPA1 (36-226-201-204.dynamic-ip.hinet.net. [36.226.201.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm27421770a91.7.2026.11.25.08.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:31:27 -0800 (PST)
From: Roy <rongh7426@gmail.com>
To: William Chuang <founder@logarcheon.com>
Cc: Roy <rongh7426@gmail.com>,
	Breno Leitao <leitao@debian.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+c75a7db5ca6ae96ed2d4@syzkaller.appspotmail.com,
	syzbot+8c0a48f6c8357c9da819@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] configfs: give the root directory inode its own lockdep class
Date: Thu, 26 Nov 2026 00:31:21 +0800
Message-ID: <20261125163121.620898-1-rongh7426@gmail.com>
X-Mailer: git-send-email 2.51.1.windows.1
In-Reply-To: <20261117065314.4309-1-founder@logarcheon.com>
References: <20261117065314.4309-1-founder@logarcheon.com>
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

On Tue, 17 Nov 2026 06:53:20 +0000, William Chuang wrote:
> Not tested: syzbot's own C reproducer.

I tested this on arm64 with a syzbot C reproducer.

syzbot has a second report of the same cycle, "possible deadlock in
uvc_func_allow_link":
https://syzkaller.appspot.com/bug?extid=8c0a48f6c8357c9da819

I ran its C reproducer (it creates functions/tcm.usb0, the
target/usb_gadget/naa.*/tpgt_1 group, then uvc.usb0 and the
strings/0x409/iad_desc symlink) in QEMU/KVM on a Raspberry Pi 5
(arm64, PROVE_LOCKING, KASAN), mainline 65e4fd942f72. After it I also
ran a teardown script: rmdir of tpgt_1, then mkdir/rmdir of tpgt_1
three times.

Without the patch: 2 lockdep "possible circular locking dependency"
reports in the reproducer run, and 2 more in a run with only the tcm
mkdir/rmdir steps (no UVC).
With the patch: 0 reports in 3 runs of each, and every step gave the
same result as before.

So this looks like it also fixes that report. If you send a v2, maybe add:

Reported-by: syzbot+8c0a48f6c8357c9da819@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=8c0a48f6c8357c9da819

Tested-by: Roy <rongh7426@gmail.com>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795257356;
	b=d/+p5b+s9eHagg3/DZFVwXGyrIs0YzSs6HAzv6p3duja8SF84yQFMf9sDY1nkREp2ZzW
	 4AcRm4240Rwfq8PkXeV0qgb27jO1+keFioycW1UhpHMXDEE81InhgubWFelh/VWgsBtzR
	 oJMJrTqYiOL7hHCf8bZDnHJvdx1rrQJaJs4U6BTtFranB4mls6yp4ycFeq4gidylibqO+
	 ugEw2SnZlQ3kG8L3RNoKrryQyw5xny4/VTF1TuajqNG5LAi+rt1/+U47B5atmu4cyD/0h
	 Vn3/O58lvu5v9O6Jrlr9md+pdyZ9aSOvotd29ZP7QOYnMHuTTKCj0us6a8SN7e6+wZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795257356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AuBQKyEcSEqVjdsmPdKelR9xg5E9gpi6vzmfPVV2BCA=;
	b=oYE321N2ogmBgRmxY9aE+W8WE9o547zGDbFbEUyvB8IsYdach4zDs4dLFqcPPgkHixg0
	 RMv7wRzmkJOFehbyNHAQJcC7WsLRDcFS/2w+qLxWm43LAEk2vcF2RnDNYqhpPqMDKo76F
	 B/VGbDOMeijhChVmW32lxrPfhW6apslGp9oPhTUnY8XN6qwWCeGidoJK3t4UFze7pEWQW
	 K0UBNXU0iVCYHXz0ijMMJxoFuGDB+ocyYvge3ziVXB8qgDCzQL2NRG0Erei96wjS5V0bk
	 S00UW7wbKdSACVO5YtjSLvEEZQ0C4qvVQRjGAlnrNJj+ccO/obTrz9xLr4JkZiAD01g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tr+NBNXp;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AAD606A325
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85AAD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tr+NBNXp
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso948869a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 02:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795257356; x=1795862156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AuBQKyEcSEqVjdsmPdKelR9xg5E9gpi6vzmfPVV2BCA=;
        b=Tr+NBNXpqeLiTgO8OOS95eiW6ZcLshFYaEw4tZesYVbN1b78owj3WXV/5IVEfClE5S
         mfNIHd+RTW5kXFCJCKPypqrsBnM5yHIkmMFIEFR5ydUoblDZKW5+/1HQVpSzxPXpf2Ve
         FRv8MRoB4LwKEJ7DuWa1FCM8h3g40fh8NWaqbGHa20qnfNJ0Ic6Da4ggDAADwrs1V4Hg
         +RDGgJQADiRdU9LWqqzqFohNYAbwHD86z1/elgY4xGsjQOX2bNxNHYpo9fY5sNNgN3ya
         fbaKxq1O/RnMXLX4DR7Wt3jLlI9Muj9dZHAbhi3tEhHBSoQkimTvyhY3zEZNdu5/6c0q
         pDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795257356; x=1795862156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AuBQKyEcSEqVjdsmPdKelR9xg5E9gpi6vzmfPVV2BCA=;
        b=ZvG1KSqj7+dgKrlEcSQwyxPGiIF4/UkJE/7s03U+jZO7NPVXzPXjFYNpD7fhUrz8sW
         58TxkKZ8eXG+RJknSFTXioAgVLa9jnNLeIpN+bS3fVF9r2dpmpUc0iOjenG+ytrNxvEp
         rrTM5vuPR6u6fJxZSiPOuupkqauFJIoG94cex9ovbWLFBJHD3oMfdFqB3Gllvkc0U/vC
         AKdQP2XvYz8zf9tqaEFVqSazZZhMGM79XHMSf7yu0Mr1pbB9kdrzPyjk+SJw/OLyxKGz
         RLVQ0PxBthOK9XfQBE04kQgxrND1oOd7HTEGePGuMXdXK1B4h3my5xWp2PSFDlREemV8
         R1Yw==
X-Forwarded-Encrypted: i=1; AL+hErGIS44kxbdab8lXQizoK0PWXOE2tdlzjn+pNa5maN48fmCj0FUjACS4gud69oaXg+2X0RabZ8JLWSd0DV4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lvk4T4OFfsP9bO/9oB/zQab61O265jDr3vfpofH8rQmgvQ620
	iUcaIVVVQKyeP7S34OTcQQqiloTZOCeVobdkdFjVdiWJtoqmsC4W7ud6Vnt1LrkS
X-Gm-Gg: AZFdTZd0vdKic5jXJiWUfUffx5FOwJiz7QYGOAI1mgBNf06ihPGq9x53dxD4bVlrk+N
	bfjSbpLn+WUSjcKLH+8+3UMjPV2++evH7mBswECIvl21D5RLl1bZrz8BmRouOboUhHIQbuc6r6M
	ESRtFDBHtrMHkQv05Q3tbc6xkrnl7r/EICeQzBf7oX+HHdcRC5RlG1ckZC9l7tJ2tX7UTRmlzs9
	enEqT9XKBBG5Hyv02RGZT4NegrpTexwiAdUFq7bQMVKVJ/7wTtc5q6b5kPYdrNlqAdrZumJf34P
	ZzhkhDHlDWF+gvKU7mFR9htw6vMS15qWCSSAG7voUnj1pxqrh7jxqeHzBvtIc3dGL+ArXzN9rkR
	Qa6i2jofrbsKCmAraKSWkXn2dfWgINYuq6zBRo0c2eXSrmyI9T7KoahfKhYbdTwFT2c1Nf7R0wL
	SaWDPc98ArspAhRTKLU5cwz2i6j12+n22G6zwrp7SswJ3TVl2QNM/gYMVGF8cujWrM+2KdD+nhl
	Y86rBS620JzSB+dGFzP7FYjL37B0JeW04eYvc/3uJT6sI+fAxgoDUlxzD1xLl6pSheSsewwiu5m
	v8G6WGLOMI0sdyg270m3UE2SKWgwiU4RyXw4MBbYJfQ=
X-Received: by 2002:a17:90b:1f87:b0:3b3:ca9e:9e22 with SMTP id 98e67ed59e1d1-3b41c9b2667mr5455682a91.17.1795257355893;
        Sat, 21 Nov 2026 02:35:55 -0800 (PST)
Received: from localhost.localdomain ([121.134.184.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7c6513sm1823681a91.4.2026.11.21.02.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 02:35:55 -0800 (PST)
From: Unsung Lee <unsung0317@gmail.com>
To: Vasileios Almpanis <vasilisalmpanis@gmail.com>
Cc: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Benjamin Coddington <bcodding@hammerspace.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] NFS: sysfs: fix use-after-free on delayed kobject release
Date: Sat, 21 Nov 2026 19:35:50 +0900
Message-Id: <20261121103550.1537739-1-unsung0317@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803-nfs-v1-1-034176dab4a3@gmail.com>
References: <20260803-nfs-v1-1-034176dab4a3@gmail.com>
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

On Mon, Aug 03, 2026, Vasileios Almpanis wrote:
> struct nfs_netns_client embeds two kobjects and is freed by
> nfs_netns_object_release(), the release function of nfs_net_kobj.
> Despite that the first one, p->kobject lives in the same allocation.
> Nothing keeps the allocation from being freed before p->kobject
> has been released.

[...]

I ran into the same KASAN report with CONFIG_DEBUG_KOBJECT_RELEASE=y:
a slab-use-after-free in __run_timers() on memory allocated by
nfs_netns_sysfs_setup() and freed by kobject_delayed_cleanup(), after
a network namespace was torn down.

Tested on v7.3.1 and v7.4-rc3 in a QEMU guest with KASAN, running
"for i in $(seq 16); do unshare -n true; done; sleep 20" after boot.
Without the patch, 3 of 3 boots hit the report on each kernel (on
v7.4-rc3 already during boot). With the patch, 10 boots on each kernel
gave no KASAN reports, and lockdep stayed enabled.

The test runs were automated with an LLM coding assistant.

Tested-by: Unsung Lee <unsung0317@gmail.com>

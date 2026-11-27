Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773592;
	b=J6+b1JFHZAnlqE8FsPQQPlpnkpNT/bGakNnpg3Ii+QzMDDAqkGn9snaBKnZ7KNljDlJp
	 s/mBg9Q0lMuYALdb8TgmIG1+PuaKz6bSvW4ytu5+UEocO5xamzBuHqUrshE8DWhhYLsLd
	 Wou4bV9hrgzvl+D4/RAHpbGI6RZefR61NPvkQQ0zQB8CuUm3B5Sw54zQZyl4CtnxmFirg
	 VlSJidVCKfEv4tNoKjT79r8wN6l+5t4klJIRzxB6GCJYrQiGG/c178tOz36u7p78rMzVn
	 jM6G0DbnDkEtjyx+AednKFgmlP6rsexD5dusA9yPyk7FlrzbKNqd6LdayOypwFZ8FeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hTvv7qUUNUw1BVCSb7V38xhCLr5q5WG8pFcvGI869r4=;
	b=GBiVNs9hLONOQIRONfOUuxEC0xdnXwanMLJx+/2Sy2rK+zUNGs8JNAkkAuiZ+6rKQX7J
	 WMx/poB04YfUA8zkBRBynq/DKyOciU3vhVmgLZnNa2CmnB0XoqVvs/iAJc11rLC7xL7CQ
	 8AwQyrx0KrXTqgSyNHd+fLiSK4X17M4SK/bzgvtuF9s3kE40WZoxe8azHFN2xLzh975kF
	 SbAaBu6PCpJm1TW/oB/tWk5NFAr5Z7WjNMcQsqoNo9oRVLVwcQn0a0vEGjcW+8Yunyb8X
	 5tNIawTiBI3RwX3nA4exzh8L9QH8+Lx8bmzraohVXK5+PNRyaHIykRZbUm6rKqn/ZBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RAuSlj4t;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95EE606A690
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A95EE606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RAuSlj4t
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a6ce64b95so2823764eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795773591; x=1796378391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTvv7qUUNUw1BVCSb7V38xhCLr5q5WG8pFcvGI869r4=;
        b=RAuSlj4t9bqRTkl9psL2V3CBHAsK+PhQE2Rtk+LM12iIem1Pl8EZ7oG+W309Vb8ERs
         kYvFlvJXHQgwKpm3V4SFnDlYZy4CIPib0iLaUKiD69FOerog+98s7tmk+GMKe+ZdbhYC
         aRmbc2f0Ao6KmX0vp/IBYrFWbQRg+t30DhqH+zgAfXPMC3BB5o09vmkz0u1sJdnkfx6L
         FZi59Cfy1YrJGUKrbOjUca+uWdMERQiB3x4M/9BQCJYYer0F1C/ZOR+L2s4l+4CWl6Jq
         KtVjM3BrQb2tDXVaiNj5h82MTQFHy9YzkJ9v+H2AP+B+C88lbr3uoEUqkoVk89aBrom6
         LWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773591; x=1796378391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hTvv7qUUNUw1BVCSb7V38xhCLr5q5WG8pFcvGI869r4=;
        b=ZBU71jT+pP96JZbFygbRI71YRyNockvKOX7lbP6K+AayCY9KGi41Vx4drqY7u2uaoe
         2HEsxcBXGVHCR/vgJdfg07W55ln41fmzDsybhtvRnARJ6ZI2pbx+qDQGWGAkEbu4WJMo
         SBXVrVUMP7FyNe5s48g3EJgQBl+JJlmOpizl1GNmlLSTplSz3vLC2omdsjJTFlhNo8Eg
         yMQ1AdVxTI4lx7uuRu1IIcqhBQypxKCHM+1t0JJt5BwolhyleZVWVAL4B3eKncdaug03
         VOKjfY6xQGDJ8N1xR3qYrPIiSo+lUlil5SxDXcSYni4Hf2LO8+WyLPL6WVuUFAaY0JKW
         k30A==
X-Forwarded-Encrypted: i=1; AL+hErFg7HeQxDZ8aBCy1wsWJANeO6m+d29dTrFSLlTcXg9UeiHBBNucj8Geh95IoNLwEHmL+QlX9xIMNds1cGs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MIb/Mw4BHDcUNZyXniNwJ7mkT407XXPmgCbxnkGNf0LO48jrp
	PjjuKSCSvEhX5jqJKmWetpDMX7TnFw8o88dg2CBQyUqK+FDR89QjkTLW
X-Gm-Gg: AZFdTZeLYZaom2HMUsMvOVhrhqQCje9OxdeF2QFciQCKcImo168a4S+XEt+AvsK3c2V
	wXFuioYCh3aybhdhyQ1ysNoXfaEVQQgxAX1MGVXD8xwFYrJYt1s3Q5P34kSOr62WktJN6UbcJgz
	9ZEePcg+di+jF2Jzm3sbFGJzQA4MaLKVBjxXM1WqvAl0v6j1/bedpZ6CKC/ik2smHffpM/8sSQ8
	+get6Xip1liRKp8Shzzz9FFpcN3VALXTX1X2eCDsj6Tu3hEQiaAuQmxh4i0RnssytxOeO8I/N/m
	6/+WH/K9EiWDbaJzwMmzhf+v6d27ge6QD1GVvcOsVhnLYaL6uNLaxrT3B/OEZKAUQGrS/DV0gzp
	ig9tuVHs+8PMpEBC9ZbzKeJGHjnX7RfvjzxpLM/ieS4t3hck9cU/r7p3LOHD8tx9PDC66uuSbpM
	O/S5UOuSTM2gqwrtU49/9vs7DutAbk2J65Z62MTIww7neAP2mKzjsW8vaU8CRWIXQ59tIR4QIQw
	aXC72jXqKYKbGqdHH5vfyDutojAdSCvbQ3SULd3rsh/wzRKVpTuAdGO157BPTVjmdSEjqAORcsu
	2UPkeGsV5GDZZ6MO7oUEcr8TxneAlXTMb1FLUBI=
X-Received: by 2002:a05:7301:10c4:b0:386:d310:4c1c with SMTP id 5a478bee46e88-386d3104c52mr9148454eec.21.1795773590605;
        Fri, 27 Nov 2026 01:59:50 -0800 (PST)
Received: from WannaCry ([2405:201:a418:c1d0:90a2:f39d:9eab:aa4d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm85784524eec.5.2026.11.27.01.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:59:50 -0800 (PST)
From: Adhyansh Verma <adhyanshverma2010@gmail.com>
To: aliceryhl@google.com
Cc: cmllamas@google.com,
	gregkh@linuxfoundation.org,
	arve@android.com,
	tkjos@android.com,
	brauner@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust_binderfs: fix minor number leak on binder-control creation failure
Date: Fri, 27 Nov 2026 15:29:43 +0530
Message-ID: <20261127095943.63884-1-adhyanshverma2010@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126075835.3414193-1-aliceryhl@google.com>
References: <20261102144532.123432-1-adhyanshverma2010@gmail.com> <20261126075835.3414193-1-aliceryhl@google.com>
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

On Thu, Nov 26, 2026 at 07:58:35AM +0000, Alice Ryhl wrote:
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Hi Alice,

Thanks for the review and the context regarding commit fd2bc059ed46!
Much appreciated.

I am back at the workstation today and was following up on the thread.
While auditing the open and initialization error paths in the Rust
binder driver, I also noticed a process leak in rust_binder_open() when
BinderfsProcFile::new() fails (where Process::open() registers the
process into ctx.manager.all_procs, but on subsequent failure we return
without deregistering, permanently leaking the Process and credentials).

I have verified a fix for that against char-misc-next and will post it
shortly as a separate patch for review.

Thanks again,
Adhyansh

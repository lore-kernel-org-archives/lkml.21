Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163803;
	b=GhNlaMIvLBe3x8Dmtk/gwMykc7/PNCuHhB470b8FXOZRP4WgaNEXFbzWiBqPZ7HFlVwo
	 hX21d4VcHAd8yt5qD3/jvj1GS6mU7kLNTupZI4ahoVQynbFQYPGTcW60RSebek/lFmh/z
	 b54M7UeRI4AVwfkOL9TBsM/xYyGCBqpY0OnQkXs56LlOefcXCSV8IzkudcrDO6DGRQhPJ
	 pb1TQAOgscEI0c6C3grJjTAZ20Fd32YgCGbY/OYnyZb40eATqW9ZNWWDH1Oe31XQi4shQ
	 Tl8hBiAf1NVS1SPuRrHXT1zPJp7y7YUHVjMNzeZ8ZW6wdGfLqlQexldlPi6OVRd8vDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=FroopTMuPleqi9xrjHNZRUYAbvATL8axnG/vJHY5tGg=;
	b=UQL3t92JaOX/YHVX4/uMeOP5jJQBZ1AP3k6+iQfPwFIyhQA4ccmUi6Tkk3gvfgy904Z8
	 O05OBcKioZui0gNjUotCdxl9WYVRh2RFuoNSUXAxCsDTBdYTxUahpDbeUP+eNs3+IPpKN
	 9wtPM2064tM4mZrreqEoJg6sfBneN6wZMZfXIGYA3mlpy8MZg12MlpBt/SH4r7C3U643F
	 LueRClgMpGbLWQhED9gsSd+ZyyFSQHevV9EgH1c16Hta+8V+8KEYvfpDDQYUAExs/oRxA
	 hre/LfzAMaZgIJFObMV2YtvAs/MvP9cRVpKX2Cjyng2lEGbJnq3nkLXxaQl0+wrmacw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AxQH6ZrZ;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F573606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F573606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AxQH6ZrZ
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso5355305e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795163801; x=1795768601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FroopTMuPleqi9xrjHNZRUYAbvATL8axnG/vJHY5tGg=;
        b=AxQH6ZrZwJ9W/gB2/sdllan6OZ4LeaBTfBKfPRBCT+bx4uIxeRrAtD3oGP6kzXMN7k
         HbC1fbAxzzkJWjipSC2Eblyo1vOzOExgA8/qO1Ic344acKBd3zwu43WcoQUt4Mk3fj2M
         v3cNi0+bCQPBoEX5mbQAkmCL/yAcZez7Av0PRoht88S3RQaIwoohB/zHwrAT1TB0HhdK
         DAvoVUWgcCm+4T6ETWHFCUHgSaen0n4x5s9FkMZG/Z/KKkRcEWhDQQIqSjOPxSMiQKOy
         QLB4+p3JhAD92LCmBlNbFgRX8f1MnlpwL+C32Vy+EVuoWH4LN4JhVN2DbZDpP9KkpzPS
         o0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163801; x=1795768601;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FroopTMuPleqi9xrjHNZRUYAbvATL8axnG/vJHY5tGg=;
        b=yIJRCErQrEsn2Hu831b0fLZd/mrbYu9kcFs41fppka+J8PLzq6AANKFRZ3v+8SkUlL
         fjT9Qria+nQkrz19zmTaPzlsmT5mTFSV7CapagKuqN7E/skS3SUp4sHi1AakydsW/cff
         4cH9kauvFHtH+mVr6GdITqkwiF8nV2lOKD0oXhU2vYUPfvO6KKZaY8RBVM+JYbrDChJm
         QdT215Da6aGWA/QzED43HPUPQkVzwFRfBCr9lPw+suQohXKyGgUaX314fVtXEIxW96zG
         5ZD1597qMZHYv/w0bjatYRTb4BOnkOZNWdJGFaonF71Hzgclze9E3aCJ+nl0oV75cgaE
         sX8w==
X-Forwarded-Encrypted: i=1; AL+hErHl2Udg8i6WOD4Lw8tiC4AMHmUVXjRt6hIx0eK359I3rbCiuOmuM8iXz1qbxHPLITtv/C4Py/2R5lFEv8c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ORwNRqRvCLuAAhOqERDBHp0kdD+aKAOvBxjm+a3kKR1Bm3OHw
	h2XncrvOxvWw+/fw7oJ79FH+u8nb1/DlJuWDB81808k0QK/OJIa9kWgNJzRj/Ug3sj4=
X-Gm-Gg: AYBFou2HZrzdueN0DeCq1DQsR8WBryIOUHv/0D+BiRU9I1C5uuKu8KCiuGFJrmLVadC
	qydfBv0nr681lQNX/QQhi9VdDaBgpq9w6vdPuT42Swtz41ZEX7N1oBynYHlDGF8jx+BLnFtED1B
	JcGTP4QWXqstjNbfnCwn6PLTMINF7TG8r+oq4xJ54JRCiFs5Gn07e5sVWauEr4lZ22bvz+/NQVx
	4Ra91E8xAK70r22ilB6pZQci8Dla3kJE5RfC2eIydJ4d7ObTtAT+f4Xln00zfSkNWVb+lGZiPYT
	A74ZrQYZtuqcRHu0CG7EV6uky+QtMYKi9sGXIhaZ48d/yhSMlKpvF0E3NpOGgGH/TKUuyD9pavy
	BRUsXXsnyZIJGmW5tX5JIHe7VGXEaml2W/nxMZxuJWV6dWNT4L9wdYohOsEhmJOzS/s9qrFB6nT
	5aEyVFn0VlWO9C5VzO1Jc/b7eVKLoDg0TvvrX0mP1FsOoZ97dkaSftfOhERw6Kn3514r9H44uiT
	yQ7U/G44gMEFWPSlIpQwZiLPWpy+RoAtCM9oouqjAHm5WMB3t4VzVwsxG+UaVHT32ju6cCqvS3v
	cQwgbw7/UtIlogtnodbnmPCGKYgBAEVKxuItmDJKpw==
X-Received: by 2002:a05:600c:4e16:b0:4bb:6f77:1e35 with SMTP id 5b1f17b1804b1-4bb88810991mr53940545e9.21.1795163800697;
        Fri, 20 Nov 2026 00:36:40 -0800 (PST)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm126587935e9.0.2026.11.20.00.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:36:40 -0800 (PST)
Date: Fri, 20 Nov 2026 09:36:37 +0100
From: Petr Mladek <pmladek@suse.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>, Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org,
	Joel Granados <joel.granados@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Ian Forbes <ian.forbes@broadcom.com>,
	Bradley Morgan <brads@mainlining.org>
Subject: Re: [PATCH v4 1/4] panic: Add a platform panic notifier list
Message-ID: <awAGlQhpaLtrHCAR@pathway>
References: <cover.1794980455.git.zack.rusin@broadcom.com>
 <3d156f7b5ec4f3d6f91e288a38f87d2368f1365f.1794980455.git.zack.rusin@broadcom.com>
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
In-Reply-To: <3d156f7b5ec4f3d6f91e288a38f87d2368f1365f.1794980455.git.zack.rusin@broadcom.com>

On Wed 2026-11-18 01:01:48, Zack Rusin wrote:
> Some platforms set crash_kexec_post_notifiers so their crash handlers
> run before kdump. That also runs every other panic notifier and kmsg
> dumper before the crash kernel.
> 
> Add panic_notifiers_platform_list for platform callbacks that need to
> run early and are safe while other CPUs are still running. Call it
> from vpanic() before kdump and before stopping the other CPUs,
> independently of crash_kexec_post_notifiers.
> 
> Also call it from __crash_kexec() if a crash kernel is loaded, since a
> fatal oops can enter kdump without panic(). Call it before taking the
> kexec lock, so a callback that panics can still enter kdump. Run the
> list at most once, including when a callback panics.
> 
> Add disable_panic_notifiers_platform_list to skip these callbacks
> when debugging panic or kdump failures.
> 
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Link: https://lore.kernel.org/r/ateYxCu63pRY9EGq@pathway.suse.cz
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>

JFYI, it looks reasonable from my POV:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

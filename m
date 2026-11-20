Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166365;
	b=kbDwzuZe6UrtEYEO6Y9WX+6yw3XKP4Hlh8jqSQIIR1WXKGcy1qGTLUsVmj/AVs9zdSPh
	 uO7VPiYglceoX4IFwzOx8BaKiY/HzQ4T0lxkR0BUEQyd7QhjxHspp6RyiESFRstsYr1Uh
	 1lhLr8zBqsvpj0KTQdvvVDRNeh3+AuXgqZtQ8wLK6pt/ImCLxqLwMJlC6fi0PVaQqCOBX
	 s5ofSj6Pz7RAnLMaAVUVF4vebxM3xB9dUGHKTFQAapCK1USujP5G9P8GOGLpNwu6kTl2R
	 ZFFQ/q/aoLJJ9G5RhVndh91mA/Y5Obap3Yvwm/JeqdYpWHGOzQJxZoeV/XBURClrrhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NXbyh/zLUD7PEdLtCVAgHutA0kCgtrDRw7/iSzMTz60=;
	b=vFINnFRYabzvYis3X67efmdSnlvHQl10AruKoC2QVVTSgGTy3n3G0juPUP3vyoRR6hx4
	 cYrJ6PpQIFkjF4Y2mK/8Uot6dKhqSLIv6kuieWYklPIswJOAc6KSPXYLPSDQYp9FcqvDb
	 VfCXUmD5WIiunO0qlbYy/Kz9zQDXt0pozxqHn2RYmJ8wpJz51yLf6bzutXghZD6CHiPsZ
	 2j2rQzfSFwTnOwZASs558iMTcw4Y54qD/qWKr9RMh5pd/Lqhr55Fp72I/siUrtRJWNhJY
	 kuoqc9scCScvfKVDYiwjZw7853IjdLSpCp800hERa0Kk+G0za05AamA/Uhe23g/vXAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BQX8lsgV;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D25606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:19:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67D25606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BQX8lsgV
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so5884885e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795166364; x=1795771164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NXbyh/zLUD7PEdLtCVAgHutA0kCgtrDRw7/iSzMTz60=;
        b=BQX8lsgVjhQnLkh+BMUGM3sxWDYtP1zf9pxEgAiKkKpGjof4Mu/tS9qG8StyXGVq3q
         m7RwNdCBVPgRtokqJv8SAr/c64mo52W/LqtSKje4ENc37an/GgQnK0OX1OC5Ju+vUqeE
         hGENJtZiAdx2m5HXZTmVvyx3eQT+bgBs1Kqd1oLebkRW+d+jhgmcU6Rt6sBQOzY4F/he
         uy28mpaWhgzFS7YlMlXqX2bR6u1pSXMHOG11JkqeeaGr3pd2lK7lzyq4/C36KmtBH6jr
         PRD64DqzjyVDyfX+v7Q48box2mYP7Q768ngB8CZC2h9QH9nMtygWhKq7PqKgrysJmda/
         bzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795166364; x=1795771164;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NXbyh/zLUD7PEdLtCVAgHutA0kCgtrDRw7/iSzMTz60=;
        b=K8PZxceir5J2WDEvbaQWPtD8uIZl7RsQhxoLe42Sacv0xGWnc4KCqXkAjf6XPfWqbr
         Xk74stnVVBk3wDH8vacptQvXGriPQltxjDnBVEiyIH6tdCTsXN/pW+rH+4TpCwVR3bZZ
         ib3EgPp9jEr/gybfXy1SsoOWfIqs1mbJ09viOZP9vj5uLasvaBDXsQM4pWvQ6JNraqSr
         Dt/TIYfTttyFOvkWkjVTaomvvxUHklnDnfEt0RP819P1EL05cWH0yma3kgcmzjlQDvii
         G1pyBu3mGcRrJrSdnD/BEp3e7RgKVU1bBrQjY3m1iRIBnc1Fv6NPCq6oWHKAEOWfszNH
         Jzvw==
X-Forwarded-Encrypted: i=1; AL+hErEap02oz/PYkUM3Bpg/9XT/X3Y9KspSWWT8HjQRFlYdpscWkbW3BpZacLusbx0m2mkRRPWh3u5Ne+h4g34=@vger.kernel.org
X-Gm-Message-State: APuU4Z9s/SbfrJtb2/fBggWLE9FkeVLoelkaiYDhYAGdnHzYtHJ+j1qj
	RJndJAuL0AU7+VCKmfgnnKo4hqeIzzS1BJoNiBVWUaiG1NTVN2TG3WumXNBF/A+iKdI=
X-Gm-Gg: AYBFou2OvxZfDHpTZc1KMAQftZCacwB35UIuLvhcTp2pHsU09ZAc95w8+2Mk9qA5KWp
	1Co1Q6Whcp1DpS4FtnxmMPpO3QlvBqa0Z9V7br+wxhIKwnP5jcao8h3O/IOk2M4aNH+IhTTJUBr
	Sm1NK5q+jHwoqYUjo2WIj1dCqbzcdYnTbCXU0PbON4FcySSOAec/hEtBRrINmlNLt6wBs0rTs2X
	XqoVfA2dt7oqfA7I0JOFScnOSZgCLu1mQNF4QaFE+cAKt7cG33T6uHGlI1JiIWyhIXaQklzOXbc
	XkfhZocNzU+/rrg7c+tSRDaJ3xU5Q7ah8idikWRwN8yrzsOkicUqQ2yfLJ/YKq+43n0lXoF6ZF/
	AXQ/QUi6HbzDEKKNHYFGU9q7wEzhN4Rn1c/z0W2zZuDijSdkB7txPWmK9xFuaa1Hi/DSE8UBiY0
	A5UbflI0K4o/QH88OUVONPR1YxEpOVWx2lAMsn3M4EkZHMnu7MAQG4mZ+piu2i8UNMYAmQ+bLDB
	Y2wwb1Lj4alXUc+LXKxPBUBvzDcA+T8JS3SpR+hosTidzqwjEdwlNXvaY95YVgLyiKprWJSqFKE
	wsez2eKaZ/9H4v/ZmJ8q
X-Received: by 2002:a05:600c:530e:b0:4b2:2ec5:8a2b with SMTP id 5b1f17b1804b1-4bb887fe8f1mr53972495e9.10.1795166363741;
        Fri, 20 Nov 2026 01:19:23 -0800 (PST)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f643adsm27023055e9.1.2026.11.20.01.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:19:23 -0800 (PST)
Date: Fri, 20 Nov 2026 10:19:20 +0100
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
Subject: Re: [PATCH v4 3/4] x86/vmware: Add the vmware_record_panic_msg sysctl
Message-ID: <awAQmI2wu0rI-efH@pathway>
References: <cover.1794980455.git.zack.rusin@broadcom.com>
 <4c5de34b10f579368b890eaa9333a2755886bad3.1794980455.git.zack.rusin@broadcom.com>
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
In-Reply-To: <4c5de34b10f579368b890eaa9333a2755886bad3.1794980455.git.zack.rusin@broadcom.com>

On Wed 2026-11-18 01:01:50, Zack Rusin wrote:
> Allow administrators to disable host log transfer on ordinary guests or
> opt in on encrypted guests. Expose the boolean recording policy through
> kernel.vmware_record_panic_msg using proc_dobool(), as Joel suggested.
> Zero disables recording, nonzero integers enable it, and reads return
> 0 or 1.
> 
> Register the sysctl only after the logger is ready. A registration failure
> leaves the internal default in force. Document that the log is sent
> before kdump, and that disable_panic_notifiers_platform_list also skips
> it.
> 
> Link: https://lore.kernel.org/r/4e73yd2ofpdzl6rptzvd74no3hnyfblknoq7wzxlw7f3zjbz7c@srfabx6lsusj
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>

LGTM:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

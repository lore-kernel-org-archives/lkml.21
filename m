Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165838;
	b=iRVVMCywZf4PmjIJQxmXkf4QST5aUIDqXEGAOiRInnnVle0q6tCRzgzLq5gRCnbXxKqT
	 RpoKG5WYUzXvZGpJRoJDMl1u8JBJnicbfATr5bqlQor+a6tsLOsgt+wJIHoLtl2DwzT4l
	 /zUlmalS1d5lk5C6VZnaeKWk6kq+mZng/UbGnc0BhxLh0eVNzvKVgTWaurysPXVisdH5n
	 297QknAqm1A3PAnGP+oW2cYzbF8sAw0UI7lpdSRWBu2vIoxWY6dmBVOLd5zWbAl4ZPEoF
	 cpcemHr95dDytkc0GEOiumPbRJW756s9Y7Oen0Lj2ayhJjGGdYtF1V5rDrEfjJA11QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DSSS9+Kfoc3mBii8TnSdmAyAnW6IkpsziMrkIvRl8EY=;
	b=ASPUg/7UL5nJLZjLcIj5g/wbZFxFwjM+/jhTekYP9NHZ4CgLYEAe+uZf0fMtKkw3znU5
	 0LMAvtuhO0jv2SRksTrd9kz0R+Na4na/SeulCVTle7QmZ8zc88daiczjmSfSdmTT27mjq
	 hVneaV2vtLQ6QR+asm8aTwdbGcF0XY5YrbC0BZ0ISH586kgf6i0rexfrZ/Q/yAoT0A4C7
	 NOzWbELn5KSZHKJY1l5njV+uHJTSz4s1HW5zI50sawjBanJyTJrww6votS7nd6gQvSD/x
	 Wv8yfunas7Nw8w5g+9SJM0l1pquR/6ZWCl/gwCvDKbL5aFTxIHmqzkYKciJt1XJFMyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NE7Gm+sN;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BC5606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54BC5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NE7Gm+sN
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so351674f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795165836; x=1795770636; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DSSS9+Kfoc3mBii8TnSdmAyAnW6IkpsziMrkIvRl8EY=;
        b=NE7Gm+sNDCoFDIhu5kQ8biWSURUgBl99wQeBaD/DGxuf5jNbr9GQ8WsqbkHHRF0Ex1
         FxijF5AICR796Q2woFKU7E5LnAP6h9SLne82bqWcOEojGc5oygQCZTpbnpQPhW/x/V3l
         k7llf4PMQF0WnvDNlXQYLfu6mB12uZIBSpjt2zhlpGsXkG0tiYGlZjJT+Qi7bL8Dr6Kg
         zWGVIbNbck4/VDmpkaYvY9mTq5dZ/jaK5y+vHG1OMewjpkWbMho/WMMkY68IhES2kPV3
         BJagtKeeZouoQRIZqrfNzVPbc9Qr5Fz9Vh/bFTa5rzL3dKohm1n9HvEcVYvYTQK2Nkh8
         9sFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795165836; x=1795770636;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DSSS9+Kfoc3mBii8TnSdmAyAnW6IkpsziMrkIvRl8EY=;
        b=BvQrxX3af1bL1u07UIkVg+wABHayRIolYCCYACrUU3yG1kSCtW8BvGEdoNDN/smmEG
         ge+j/beHYHu/q1bNJQhKM42XkEwf6fDVJuiycLQrHt4y+aynp5HbeVut35odSYBae8am
         n7TCG1NdK7aJxFJP8gpP3ZH9q8+A9px1DLKPeo3MvTuAGcxgyUcjU6gHxnWIF0Uq3sOM
         2wx0+KEZocI8bj1pen9SGIYJrSYEsX+xcKK8s18JIt0dJJ9yefsNklCKc0VdSV1B29Cr
         Xq7ESZfTyMYg4Nq64CFszlxPzj4MfXfmx3lWNAjyS1BwRVuwrjAXaXzayx9OUUh2+708
         Ly6Q==
X-Forwarded-Encrypted: i=1; AL+hErHww5wVJCgy6VISuxMlNYI130vnqpLNXu6E5SvYV4gsXOVmLa4VPKaP01p4nlfUVKpK1ug4v01OOVxRI7E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5vnbEI4kX4VRVV19iAIdq5hMoWmos87tiDgnmDoaBHhEhUmYm
	A9q4V/a8Lg7+Lbn2fOQQl+3xPUivkGz67FxsnHX7QvrTHMRoPRZPW4khl09ovsEuOmo=
X-Gm-Gg: AYBFou1xkB8JhoSkTR+heor/qnQ8qhXqw8y+W+d4y+EQYOIaSq/zBkUsL0HHwgEa5C1
	Q0gANLltrLVFNhRXDLT3rGbIdUqjYF6Y0obD+cTseKfIfTQ3ayXE2RNrxPJ8UEzK5k+ZSe4Giiv
	iq0Lx9Oe+gpLWgp5+gPcqR+qhclj7UIoQmlGh7icUgK/tgfMusxw3ASOmdDe7Op/17eqyfism7Q
	h76r2Rv3GSx2FSNOe812lRJD/iZOGsPnmZJ/b1R+wyL6MK6YjbSTW/WJyj6wefdxhc6k4K6te6U
	EHD+sCnd6yAm7G7riVkQ9lAbXI2KrUgU7AZWFPh7PaoruPlm6uhNfKIQxcS6BKiT7tJ/LtXmWQn
	wrtSeELUxUbXYavTx2MTIA+4Hw8/hWBgnx83ypldINqVRjcJCaliYfuVp+Mh3s+fn4ztDY/Clib
	m2WRxaKoOSwplM+NdJaEsiqvRySpnv2rZh/M7i8TcqCPkgLPocByq6vt+nDP9OOyYb/qIAFcrxn
	23X30j5R8wn/EFFTzMitXuym81FhDPYmUNqA3uQD3bHh4yumdudbRUbUsWUz9NFI5pNyxIx95NH
	Pbswt3C/ruoFZivPngHQ
X-Received: by 2002:a05:600c:4755:b0:4bb:7033:de79 with SMTP id 5b1f17b1804b1-4bb8881dd02mr49732185e9.35.1795165835650;
        Fri, 20 Nov 2026 01:10:35 -0800 (PST)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm114241355e9.11.2026.11.20.01.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:10:35 -0800 (PST)
Date: Fri, 20 Nov 2026 10:10:31 +0100
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
Subject: Re: [PATCH v4 2/4] x86/vmware: Add a bounded panic log sender
Message-ID: <awAOhyq48jRfcVWd@pathway>
References: <cover.1794980455.git.zack.rusin@broadcom.com>
 <7e985e2aea6507a0444addd816d4251f78d048f6.1794980455.git.zack.rusin@broadcom.com>
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
In-Reply-To: <7e985e2aea6507a0444addd816d4251f78d048f6.1794980455.git.zack.rusin@broadcom.com>

On Wed 2026-11-18 01:01:49, Zack Rusin wrote:
> A VMware guest may be unable to save its own logs after a crash. Copy
> the newest kernel log records to the host's vmware.log before kdump,
> so they remain available if the capture kernel fails.
> 
> Register the sender on the platform panic notifier list and send the
> log through the low-bandwidth register interface. Allocate a fixed
> 8 KiB buffer during early init; 4 KiB can lose useful stack-trace
> context. The callback allocates no memory and emits no printk
> messages. Limit the transfer to the buffer size and make at most three
> attempts, retrying only if a VM checkpoint interrupts the transfer.
> 
> Enable logging by default only in guests without memory encryption;
> encrypted guests should send their log to the host only when an
> administrator opts in. The copy is best-effort diagnostics; kdump does
> not depend on it succeeding.
> 
> Suggested-by: Michael Kelley <mhklinux@outlook.com>
> Link: https://lore.kernel.org/r/SN6PR02MB41574A11D309A0530C63E0FED4842@SN6PR02MB4157.namprd02.prod.outlook.com
> Link: https://lore.kernel.org/r/20260309235250.2611115-3-alexey.makhalov@broadcom.com
> Co-developed-by: Bo Gan <bo.gan@broadcom.com>
> Signed-off-by: Bo Gan <bo.gan@broadcom.com>
> Co-developed-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
> Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>

I made just a quick review of the string manipulation and
kmsg_dump_get_buffer() API use. And it looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Note that I am not familiar with the vmware hypercalls so that
I did not check this part.

Some nits below.

> --- a/arch/x86/kernel/cpu/vmware.c
> +++ b/arch/x86/kernel/cpu/vmware.c
> @@ -52,6 +57,23 @@
> +#define VMWARE_LOG_BUF_SIZE		SZ_8K
> +#define VMWARE_LOG_ATTEMPTS		3
> +#define VMWARE_LOG_PREFIX		"log "
> +#define VMWARE_LOG_PREFIX_LEN		(sizeof(VMWARE_LOG_PREFIX) - 1)

[...]

> +static int vmware_log_send_once(const struct vmware_rpc_channel *channel,
> +				const char *buffer, size_t length)
> +{
> +	u32 info;
> +
> +	vmware_hypercall5(VMWARE_CMD_MESSAGE | VMWARE_MSG_SENDSIZE, length,
> +			  (u32)channel->id << 16, channel->cookie_high,
> +			  channel->cookie_low, &info);
> +	if (!(info & VMWARE_MSG_STATUS_SUCCESS))
> +		return info & VMWARE_MSG_STATUS_CPT ? -EAGAIN : -EIO;
> +
> +	while (length) {
> +		size_t bytes = min_t(size_t, length, sizeof(u32));
> +		u32 word = 0;
> +
> +		memcpy(&word, buffer, bytes);
> +		vmware_hypercall5(VMWARE_CMD_MESSAGE | VMWARE_MSG_SENDPAYLOAD,
> +				  word, (u32)channel->id << 16,
> +				  channel->cookie_high, channel->cookie_low,
> +				  &info);
> +		if (!(info & VMWARE_MSG_STATUS_SUCCESS))
> +			return info & VMWARE_MSG_STATUS_CPT ? -EAGAIN : -EIO;
> +
> +		buffer += bytes;
> +		length -= bytes;
> +	}
> +
> +	return 0;
> +}

[...]

> +static int vmware_panic_log_notify(struct notifier_block *nb,
> +				   unsigned long action, void *data)
> +{
> +	struct kmsg_dump_iter iter;
> +	char *buffer = page_address(vmware_panic_page);
> +	size_t length = 0;

I would add:

	BUILD_BUG_ON(VMWARE_LOG_PREFIX_LEN > VMWARE_LOG_BUF_SIZE);

just to be on the safe side.

> +
> +	if (!READ_ONCE(vmware_record_panic_msg))
> +		return NOTIFY_DONE;
> +
> +	memcpy(buffer, VMWARE_LOG_PREFIX, VMWARE_LOG_PREFIX_LEN);

I would feel more comfortable when the trailing '\0' gets copied as
well, e.g.

	strscpy(buffer, VMWARE_LOG_PREFIX);

It is not strictly needed because the length is counted
explicitly, strlen() is not used. Also vmware_log_rpc() does
not send the trailing '\0'.

So, it is a rather a defensive programming. The buffer might be handled
another way in the future, e.g. printed by some debug code, tracing, ...

> +	kmsg_dump_rewind(&iter);
> +	(void)kmsg_dump_get_buffer(&iter, true,
> +				   buffer + VMWARE_LOG_PREFIX_LEN,
> +				   VMWARE_LOG_BUF_SIZE - VMWARE_LOG_PREFIX_LEN,
> +				   &length);
> +	(void)vmware_log_rpc(buffer, length + VMWARE_LOG_PREFIX_LEN);
> +
> +	return NOTIFY_DONE;
> +}

Best Regards,
Petr

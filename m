Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440934;
	b=Xq5jyoPC50SbEaH31kHMyjuZy5QrwrysjdRYiUlbdKeKho2CI3DUkVj4ARtvUQhfcIrw
	 Q5shqL+1+AzXMPAFiT7O9TAAZeMdzEPDBHUmR7Uvm7D/7iN1+ggX3l82NxTmT3WnfPP0+
	 KXdYJQY6Tjbb3LFdWNAv62xpZIYVzsGM5tAeDmOvyouWZQKvu2ZplGgY2WC0umSE/BAPj
	 +2R3hbAAHZSvPHSwUpWim8lbZrR7cXZyqBTIlu+3qOuKIvjhWaYMhCUVparRZfhLCjzbC
	 pNftK/3VEQaD0rWmzDUc6EUdjhOR6JaY9at3/0Zg7nMIpjXS++2DFXoSCqtjPWyh28g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=scx32ipdmzZF2WgK72vmGUFyDo9O6eDPU6M168osIuc=;
	b=PQjvDR0/8oOmANuWgAx/6jxaGUkqMqMtwrHLlBm42vVIya0bJho2DEn27aDa2m5xZ2TC
	 0bTO1XJYxK5al1HXcc2Nk89SUWwFTstNVpSyJYvAkDIUwh8Un/tykiuYqbruZoHiDq7mG
	 7OTLAjqO7HUevgOoHUdGdkFya3sSZIXn0hnJn1XTDwjpMqZRCOa1e0gyk2tVdJZjWo+k8
	 veW1FhsA8fTbJ95BCBeweIW0IOWuBRXYHWcJLmBRQ2oTvw264ahqaCjvbTZLLLev8td7A
	 e9lA2FBJnDmqK4lhQz5fmT4zcMSvoJXn3oEdByJX554cx/5aHA5nHoeC+p/mYDw5hDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="v/ILaTU/";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC32606A33B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DC32606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v/ILaTU/
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so28284985e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795440933; x=1796045733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=scx32ipdmzZF2WgK72vmGUFyDo9O6eDPU6M168osIuc=;
        b=v/ILaTU/7bWg5GApb65WLg4awDJCuN4p4XNf0kXaMPqk/HUIGDI+Xbq06i9Utpmmib
         OQqr1eVnIILeeQbJEVc6ncw8bSGgj3jeChoH7Kk9A10TQi44Ww+KonrQbb+HgffZfa5x
         zFhE3RBlJLcMCY1gvOlSZpysY7c4VWE1XkPTGubFxj+AIgaXW7naxrT2vgHXIDW6ki9l
         hIOob0L9YMtximd5TaiqkDZTYXkuCXHIT/d3HUok6+HqvuFW6kipibWhKWZ+yfM/8J8J
         t5Jm4wul520REt2NLt/eRPryrwbjLY/Me7G/0vHxU5v2Lo8Si9vl/jxkpMFKhXHiltgP
         c1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440933; x=1796045733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=scx32ipdmzZF2WgK72vmGUFyDo9O6eDPU6M168osIuc=;
        b=fKqIEFhVaXKr9rDPjRmjK355T5NqU/6zFwnge+nuMz279FXLFwY8K4RfDJ2YpuZGFW
         y5kLT8l2lei8FrZeZdtYvzonR2aKpqqvK13v/pYAFemy2zOjreyNe32eROU0nk0VvPaJ
         1hKtvOoR2w4LE7MULO/IR1c89oNVifjI4kAhsNkaadpaSoIxFKhXp2/qIS9ED5Rc+6i/
         0CRbTqmSenFVpWiMpoySM51WkEN0pYwIOZ3UhN2njNPraL13SU+IYODP6GOCOD/WMxY3
         euOTA+EZYWtenp9CwQ/mu0PQLW9S4ploI4xmEsUB6MfrFl25cb/yZubr6SLJhcM5STd1
         KTzw==
X-Forwarded-Encrypted: i=1; AL+hErF4ZThEzPRivKMQE8lS0+4PTexpmZlDTL2mXfi90Wf4UWCoW52sMjC5iz7AJhAgPEDgos6QV7LHGH7uT2E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nre6Gtc638hyxCpK3uTrz2co+M+JgErdfXq0JlZQs1N7c5uum
	i7/AcFNJYM5PkDL1bzYfZ96WOpRFvXjCDlwtbpPxGQCHxjCYxwvu1GYp
X-Gm-Gg: AZFdTZeDCx+KLBWuChl1vtqaLrYSYmS5y+hZ0vJaudLvVk+74S68+62Za4P0l3Ifl6t
	klGE8R+wUV5q5IFE87gPnyxJURfscUziBlAp6k3jhGOHIrKQ2EEJ53dNKkgIzwAVbaf1kMBCvCr
	ewxfQYAfxYpOgAga0RzTcsgk3cXB4OnZF1w2r2EUP3OvU+9yXcv9tWrGReNa9Xrwk+m/FLwPLj8
	5FU7xyomKQoeEVFFcGZa82Uj0qnkC78iw3kE5/ZO/QrLk0o4ilMyfPq9HCq8ILzLEmo6EVze6Dl
	5FYZUhCGF3/QavyutnKA3hmG3A9mzLzEeSjVoxZ1AnqxVfXOfgTCtVThxXOiJls+FyAh21wpkiV
	RVV4jSPzS0NdNSWhauWId8LtDPFnpi7najOxi7GVV6TDypV6nC6Ub795w6OQnRmJe+qQSRnTg+7
	chRyoVBr9/9eUr4tqyrrAoPyK1PvdJN8/vukqikFQwoitjcV8JbHW8br/OOobrtVNvun6QFqz7X
	TXhO1LDTz9pb/GcP+yDEIypKgOzXEcYezp6siBjvtQIsklhgbVJvsJoBqO4eY6bLzAlVCJqLGTS
	gfmcKqLMdjjetOP79c5iDfkX/jQO+l1I2FERbxXHli9Aa8Rj2naiZ/A=
X-Received: by 2002:a05:600c:638e:b0:4bb:6c5e:b006 with SMTP id 5b1f17b1804b1-4bb887e265fmr224576995e9.3.1795440932435;
        Mon, 23 Nov 2026 05:35:32 -0800 (PST)
Received: from CachyOS ([176.88.126.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm504183485e9.11.2026.11.23.05.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:35:32 -0800 (PST)
From: =?UTF-8?q?Asaf=20Nuri=20Bertizlio=C4=9Flu?= <asafbertizlioglu@gmail.com>
To: jgross@suse.com
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux@roeck-us.net,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	peterz@infradead.org,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	tony.luck@intel.com,
	ashok.raj.linux@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Subject: Re: [PATCH] msr: replace rdmsr()/wrmsr() in comments
Date: Mon, 23 Nov 2026 16:33:38 +0300
Message-ID: <20261123133338.39023-1-asafbertizlioglu@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123080822.3426355-1-jgross@suse.com>
References: <20261123080822.3426355-1-jgross@suse.com>
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

On Mon, Nov 23, 2026 at 09:08:22AM +0100, Juergen Gross wrote:
> diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
> --- a/drivers/hwmon/coretemp.c
> +++ b/drivers/hwmon/coretemp.c
> @@ -67,7 +67,7 @@ enum coretemp_attr_index {
>   * @cpu_core_id: The CPU Core from which temperature values should be read
> - *		This value is passed as "id" field to rdmsr/wrmsr functions.
> + *		This value is passed as "id" field to rdmsrq/wrmsrq functions.

This sentence has been inaccurate since it was added in v3.0:
cpu_core_id is never passed to an MSR accessor. coretemp reads the
MSRs with rdmsrq_on_cpu()/rdmsrq_safe_on_cpu() on the logical CPU
(tdata->cpu), and cpu_core_id is only used for the "Core N" label,
the sysfs attribute index and sibling matching. The current driver
also does not write any MSR.

I think the sentence should be dropped rather than renamed. If you
prefer to keep this patch mechanical, I can send a separate coretemp
patch for it.

Thanks,
Asaf

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625140;
	b=HbWmf8fT16uil3tYrxKmXY4lsFnEMG+TqqvxdtPkVJLwwxTTIRu1VRUqJbVsLeLNgzig
	 Ocj05nBm2LyfgSr0qwlVCiwOIVcq2Pp9Rml6qLbfYq2kr7Ufqz81AhzwU5JbpJvHcQ56k
	 6in8p4ljN05wKsdn/oTh0G5tWlwFEP/HX7Puzy8jvM+emTdaqeDfS5DrbLJ9VvKm7uwzr
	 0D7fiLi0u877EHWVc47PXqe4Wot1gcEI0zYj/ENyQTs/j3iFphKROWnUDT7+Ijn4pavBQ
	 YEqTq6fXYz+t+HPConnuvbqBD1xiziLzUKGGlAKps5sGM3/D+FdcDsBertjlEyb86QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qzSNzkmnLjAnm2o7UEPNC82u2CvWGqHDymHqRLR8nws=;
	b=10/9DkLxd/vdqRkrORM+FUeIeSSgyJyCVxIQstdaXuDkNkuwSAdQovTfxIS8Bj5UBk0w
	 NDNXO5yNOyquPXD8qI0V+1zyfkuH5IX+BDNAuORZk7tl8ijPE7wq5GFd0Pw4ZOcM+tgew
	 BgriyHNmtfqnEWCsxNu/PkXSePsuBnpCrlVgflmacIsAPS8qYfcO9VEuMa0QDBkZ5WuTu
	 eWl+p747BPfyxICPGpVW6rRkkxRw70t3ijOVs1DOr8rlZbsONzK05ASo8ELdTpGJcbGXj
	 9pSAzVr7zIxS0VDWi44YyIanoyracFaZZj36/nhaIUPkbQ7yHuSOavjJP/Nk9LiMUXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VeMZMFlK;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5A1606A684
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B5A1606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VeMZMFlK
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so4919331f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795625138; x=1796229938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qzSNzkmnLjAnm2o7UEPNC82u2CvWGqHDymHqRLR8nws=;
        b=VeMZMFlK4XeBzwrDD6z4Doe5ujZ5PmFlBvgdtXgvDNgqyB2+a2sCMN2wk+r327T/uW
         /r2BhYppBsmLCfA6wEf9rqAgdyevRRA01ag2IXLdtngT05rT8V5qUBbFQDnjjQgYE2gf
         VRO105Wv3wS0sYOzpdh62UmMxKFuJZsiAfPK9beaxT/i9ZUHpkfJOUrelw8QBpX9lGS4
         m35Q/nRZpkrOo84dL5yj6BJK1saMLREXy289b+W8lcU1Li54eo2LPH2XZ2BzxTKFv4V2
         TU/7Cyf6kqOyQ8kgJ2U5PgB/NbN2a8Bu0WSQShF93YOhfgaUMd2kQPQDvfuKKEMIIK8r
         gfQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625138; x=1796229938;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qzSNzkmnLjAnm2o7UEPNC82u2CvWGqHDymHqRLR8nws=;
        b=lsjxOLCLbK4g/ZQa2aV1Oi72lzNKrWum1047V5ANwZ/qu6Z3Wo19OKUqQJboIwp+Ut
         BaPKbvxI9Vf6wXoWO9MlykCI25AbeMtrLmnUxv4tSu29Y/ZKOuqEMd+HYcOqXPV5Xbfa
         CZBhYS4SZpu0SboLpwMgq8YcM/nG/KvEm5O4pWZVUoX3iRuLZEkBfHSfl5ESzBSva4Cu
         CdrtDB//EYMcF5Ui6eD4wOSLb+xBTxQa9P4myCWI4pKSs4YxDgXnvH12L3c3k+LLa0E/
         BOvham9yWwGz3uTP8bwHqZqZWhFVvt/ijElJa1/tNAKvQQsdWVio4cTXF23QjKbNaJmX
         d6aw==
X-Forwarded-Encrypted: i=1; AL+hErHtwdHpMe2VKKj+6/PxZbQtWwQ7+B/J4hA4iLHfgwn7VmBNlV+VLXScnGDFsxRSXUGvCMFpY0TWe/+TPYc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EmBCY73QIVlbxvtKBJZEw7aYwvxtbq2cqWA3o+8a6JLf3ciPs
	k4I9t2Emkgw+0wFGOFlqUfDHqPHp+MP/aO/1nZ9dtbTu2Lo3P/TvYKcZq/jFqJm30dw=
X-Gm-Gg: AZFdTZdKM1S/U01UTaBrs/IuiMPbOHUgSlAwzVkwqUf7hMlNRscpu6EhCUn6a5iYdKs
	ZlDfWs9g9mpf7lZAp08nMxHQIwc7840/iRHj7KcTHdKNrwoO5LLip5GZXbNWzxOvIlYyAZSdI8T
	LB1Yr+4+pSywEC3c+AxvozM+WcKuKfLh+GofwDv65NhTSV3LP4aBkeUGnlG7YZWin+5iLVaiA4g
	m81KTdZvPeAdITb5F6eaIq4nOvlNGrf8cCQQuhRlnVoTqZ7/oTT2YQs1qw1KHvn/koqpDohRMIU
	GbBtHLG9OO6jf1VIEkOD9MQbp6IPjAzUASTxAj9WXwBkCvs2EA+qElN1uaNFrHoqXFnqrPlm+VD
	BzhGPXmXmWj4Np0sitaq4gFSSrx5Xr18w3w+FISXftKkDoxRn/SkNgy/ME+MUXA9fzPF9hz2bqo
	SHxy3yfII/ZIiU9rCMLefWa1xql/pcZONQzkGE45vXbp1ZtY2mlwRa7l1HkwWlsaPGLcDWlC0Fs
	kmGnNh2DCIoEsaav0PBLMt1yEQPDVgAR3muuyjAKAkWgvtHhcIpjZdbDw2sC6slLq2pGr8xqhPG
	HR8GYvNVmA4Hwlgj6z2rYazOyEZd5fypWf/BZTMOCFTSTvs3/qF9sl9A1A9z31Tz2Q==
X-Received: by 2002:a05:6000:4617:b0:48d:f464:6989 with SMTP id ffacd0b85a97d-4abb18cbe2cmr35982135f8f.27.1795625138335;
        Wed, 25 Nov 2026 08:45:38 -0800 (PST)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c50sm34852448f8f.37.2026.11.25.08.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 08:45:37 -0800 (PST)
Message-ID: <0c2e606e-e0b8-4466-b9dd-4db14cc35d1d@suse.com>
Date: Wed, 25 Nov 2026 17:45:36 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 2/9] module: Add module_kallsyms_find_name()
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>,
 David Laight <david.laight.linux@gmail.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-modules@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
References: <20261113221248.3535369-11-wusamuel@google.com>
 <20261113221248.3535369-13-wusamuel@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20261113221248.3535369-13-wusamuel@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/26 11:12 PM, Samuel Wu wrote:
> KALLSYMS_QUERY_BY_NAME, added later in this series, needs to find a
> symbol name or prefix across module symbols in one pass.
> module_get_kallsym() walks the module list from the head and runs an
> export bsearch() for every symbol index.
> 
> Add module_kallsyms_find_name(), and put the shared query struct in
> linux/kallsyms.h, so we have a more efficient linear walk.
> 
> Signed-off-by: Samuel Wu <wusamuel@google.com>
> ---
> [...]
> diff --git a/kernel/module/kallsyms.c b/kernel/module/kallsyms.c
> index 1ff8ce857d92..72006c9bad42 100644
> --- a/kernel/module/kallsyms.c
> +++ b/kernel/module/kallsyms.c
> @@ -406,6 +406,63 @@ int module_get_kallsym(unsigned int symnum, unsigned long *value, char *type,
>  	return -ERANGE;
>  }
>  
> +/**
> + * module_kallsyms_find_name - Find a module symbol by name or prefix
> + * @symnum: in: index to start at; out: index of the match. The index
> + *          counts the symbols of the searched modules in list order.
> + * @q: name query; if @q->modname is set, only that module is searched
> + * @value: set to the symbol address
> + * @name: set to the symbol name (KSYM_NAME_LEN bytes)
> + * @module_name: set to the module name (MODULE_NAME_LEN bytes)
> + *
> + * Undefined (SHN_UNDEF) symbols are skipped.
> + *
> + * Return: 0 on a match, or -ENOENT.
> + */
> +int module_kallsyms_find_name(unsigned int *symnum,
> +			      const struct kallsyms_name_query *q,
> +			      unsigned long *value, char *name,
> +			      char *module_name)

Nit: kernel/module/kallsyms.c already contains a zoo of lookup functions
with similar names. Adding module_kallsyms_find_name() adds more to the
confusion, being similar to module_kallsyms_lookup_name() and
find_kallsyms_symbol_value().

I suggest calling it module_kallsyms_query_name() to match the
kallsyms_name_query parameter and to express that this is a structured
query, as opposed to a simple by-name lookup. It might be a good idea to
similarly stick to "query" instead of "find" in kernel/kallsyms.c.

Otherwise, this looks ok to me from the modules perspective. Feel free
to add:

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr

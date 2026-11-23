Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443050;
	b=jqfBLZ3UoZJmSY2CrMgPd4x6g92Be3/jIjmpKOt/EQEzHnBzn1sEF1SCy+zp1SAJX20G
	 v218odF1Hp16m3JZK+G1ge6eN1oKNuNRai9RGSw924tGqv6KvAvBhm0V6Tmr6798o61aY
	 a6Cog2zte9PR1P0bPn2Hi3gib3IrAp1/Id8jBi1TFC5KpTSpgV2WIa1Xq8W1kz7UD+5Zb
	 l2NhbTZk5KB+DbTXc6c1WhR6SFlcOq6hQVHtiQ5bLIcA1EUdkdEj75A/1xL/nrdOJ9MXl
	 ytOhjCAoLPXz7+WDa3gk9/myYuGT8EOENAL6xPQx0630F1B+kyQJuHRr58jRsqkhwMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2CrQ8byNBxWbycTnDL6KtWcb6fchKu5DyLo4nJng2g8=;
	b=t/cbirCI/I8isZo4gQ1LV5cqXrTZIdgyElXeDl8y+MtuySRyKaBK6lPSGH57+DOFy76N
	 5cpOXP/ICsrfSWstcUB/wHMUeKpRyTQuzJWBRGNFmUFJ3YAIgH0Z0bvvY7Qk4PRCp+noY
	 puAf1qkO2Js/MlPhq8JnkwkSuKyT745QkbgR/2b1XiGFj5l159977QhnGzI0uNpQfz8nO
	 WbKEeAbyZQE63EXbkYBWnq8mMuGif3imuJqiZvrkMhVYkamLzwT0OzJimmW7tasRW2zYN
	 5SZ4DNZDLxQPqvTcoM+0DVU7fEEeevl437tfxF/ZPPawlC55c9qEYW+FM/+3Olh3jpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=QO9MixTI;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71363606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71363606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=QO9MixTI
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so2644675f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795443049; x=1796047849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2CrQ8byNBxWbycTnDL6KtWcb6fchKu5DyLo4nJng2g8=;
        b=QO9MixTI3SP6WzE673jroWTo4bM4VJt8wUzo6e26AhlaT1vPZku4GxlHYdZkB++1gL
         6oDwK0YsLcoirbLz7+R/HCxBIoWRYpkSTs1ly9d0bUqWGuA/B2RjKRD/plP378Q2yBID
         HgVgBVcwprrmqfdg9S9BK9pe1GOlQHNzDsrEXaINo05GNOxqnpyBuWbO/D+BOguSdtck
         51mqjOQaJ99KVbwqD3cLe4GSow9FCrIQvndomR5pb3XB7G1NhkSUPWhFHCKsMXhyR06t
         X+dHBs69Du8+rc0SQFdHBTb+O4PnXaWtVWycxi2/IVtqCeZotAjOc+BGgpVj1nglB3nY
         Zjjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443049; x=1796047849;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2CrQ8byNBxWbycTnDL6KtWcb6fchKu5DyLo4nJng2g8=;
        b=RxCVjyIQpzskjLi1BpPnc+vx67LAP9WCMv1xxTeQXkymndvKFvpg/HszFHTrF35wQt
         HBEosT3Q3wkyNpAOayQrn9exB+CvbP4EGL0u8D01YxScK8K8MvisbpSiduyX8KIQEbYt
         vugRJnsRFIw8Wrzrr1ZqmEan3Cz240fKUhyMP+KR0ZGTHD8/ITqvh6J1FvNK1YUs866b
         YP+g707SyTX2icRPMzYAWf0pnNDyYcPikSs1i7ie7a2tV6FW1xGVdGcMN1AEO/p5PxPH
         Tb2uI/nKCTGnbB6rUcmhVuqXi5e6hRIZ5Na0/W6nMvsac9w30xwLzOkO6pu3uAkhrow8
         CkmQ==
X-Forwarded-Encrypted: i=1; AL+hErECSNCjwjOBLwf4XHFnArt3ORauOQ0os3TRPH8uGTOJ8GmiJIuffaLtWbJvxRuIr9tlgXGCeoM3eEF+AtI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/w9PenrYWX689ucCbgcwOvSFyRqj4W3MAim7mvtA+luTI8weak
	79J91LIq9Q/JaHbTe4kcRISYPJXcTVSPFOfVEA/Ju92zYhgHQ8yYYhM5BsjYSaIZY8k=
X-Gm-Gg: AZFdTZc8p/fPCp6nWeHi85n0PlZUd082bifkGN4MiVCeWiaoo/Vvfuq3rJF1FicVLKW
	bnNKhJ9Xeql0rNy4CmwjRC95Ac/HInnqFavgDzXiYFh/KKqs2fI4zf5dFnjl9ZnBFSGgIriTLtQ
	1L8NoGOXTqoQad17y6hoIyQFrTe9NmBpNp7qtSgo33yOD7077jKGYGQtdQswWUzXnxm4LGc0Vaw
	TcyCFEwEHJt7N7u24FYvlehSQXPcvBoQxee952SYEUOQlz5h/CKUWQdsL4vi2nMm0XZZdzlRmRT
	fsmfm9TF4lbTojYQONChh1pgVm9KMZCanOFDhZb4vqhVxcfYrTAb+m4ubOgZ/POeFeGfOhQ5Uer
	GaUTQGJb3oxyP0gBIgau7do41R0/lhUu6bJkB7SSqGuoQ9S64xCm1tT6KbUvN2H7DewS8lT0/ga
	ZooQUXeHweUcVdEPGFePnKvV4QGqxL4SYNKpR+h6LKGSMbY9RiwrsD1UE4l+VdFmg1L+4Miq3AH
	9x6tKitySCIcWFoQuXcFcVxc6EY8Ydkij7sr/wXrE1Sbb4V9RVK/GJIs0DoaKuOfR3S971miE/f
	2wzSdX57zEsfgDYpbKMLBdfMvrPddtE=
X-Received: by 2002:a05:6000:230e:b0:4a6:5a2a:f4c4 with SMTP id ffacd0b85a97d-4abb7d45653mr27120870f8f.37.1795443048856;
        Mon, 23 Nov 2026 06:10:48 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm23448524f8f.8.2026.11.23.06.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:10:48 -0800 (PST)
Date: Mon, 23 Nov 2026 15:10:46 +0100
From: Petr Mladek <pmladek@suse.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
	Yafang Shao <laoar.shao@gmail.com>, Shuah Khan <shuah@kernel.org>,
	live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] selftests/livepatch: run the tests with prebuilt
 test modules
Message-ID: <awRJZokKoPXdbyW3@pathway.suse.cz>
References: <20261110161050.2451750-1-sashal@kernel.org>
 <20261110161050.2451750-5-sashal@kernel.org>
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
In-Reply-To: <20261110161050.2451750-5-sashal@kernel.org>

On Tue 2026-11-10 11:10:50, Sasha Levin wrote:
> The tests are skipped unless the machine running them has a kernel
> build directory, in $KDIR or /lib/modules/$(uname -r)/build. They do
> not need one when the test modules were built with the selftests,
> because the scripts load the modules from test_modules/.
> 
> As a result the tests are skipped on a machine running an installed
> selftests tree without the kernel devel files, for example one
> installed with
> 
>   make O=/tmp/kselftest TARGETS=livepatch kselftest-install
> 
> although the modules are there.
> 
> Run the tests when the test modules are available, so that they can
> run without the kernel devel files. Without the modules, keep skipping
> the tests when there is no kernel build directory to build them with.
> 
> Fixes: 54ee3526796f ("selftests: livepatch: Avoid running the tests if kernel-devel is missing")
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Looks good and seems to work:

Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

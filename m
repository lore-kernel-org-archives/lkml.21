Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008163;
	b=W3zTqeUXCSZf10rwelnFkn7WgFjmEnloy9aK+nj7wz5vmN/7IVP0lZwqPoQgrfmeSeQP
	 UoR+sXwOsxDrPtE5qMJYzIf1CvDJMSUbUewjsn0WX9Tq364p1FR/vHhKSkkc10yH0P1PL
	 v/zzU7vr+bhZ12d7V5CjbeFwgSFDNJ+D9sVOrmUZbvSmuLfRT+Pp9m5dtIJJlQ6vkVKeJ
	 FNvZtiaMmWUnyZx6Z95LRcF016J9lKxdQK9MEAe3y9Ba9XNjiC7wTnIb+j0scarq6hSXq
	 HyRaNfe40qd3kRvsIgibcmGZ6kg0/ml8vn1wwiipFn1mp19t47UJN9jlehsLwIYQ/Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=+wKWXTICw+rK5bkgX4OO79DEF0MgQ4W42M/9WAyxMKM=;
	b=POOqJKIN2wprkOz6t6oiQyyWDV+LWdz3C+AZ2mdlcblwXbNWQK9XQKo9h4Ux+lCdnvb+
	 4kcG44c8cY5hoA2+2nOa9bjoPhJYdZdOhckmbpLRUa29E3DG94UIUnkKqg7tAubcTZZNh
	 KP7WjIfGt27tzpearyzZdxGUntVa9gGNBxSlJHfTGH/odeUsjCkjhRgMJ38hlGFvBQcd2
	 40xYrWZntT36Q2Z5attGbkaxSCNL7bdnUGvjgMgV0AhV0hVRssBEENRuQn8XqyoSI4xG1
	 c77YF8C44gaN6fkTl4eq9FrEz9o96PZq30Oq21Mpml62zlwQEYAJQY29oM5jGpwKxpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dlNbPrgu;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8EE606A335
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C8EE606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dlNbPrgu
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso16119075e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795008161; x=1795612961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+wKWXTICw+rK5bkgX4OO79DEF0MgQ4W42M/9WAyxMKM=;
        b=dlNbPrguCgVqYXFYDz1P6ETpZkY6b9CW2PmSUSxzaGTGqkWyeZnAhpgdAXWcl2sxf5
         tOkKYgfxCO+6SDl0hNOh4dva/qaMAzN5dqNkCW70X0bIDZnqYLrKwX3dVl4GtFu1wStw
         Ftq08ZhaTalQh/h0Bkinb6AzR8B4ZT3jRBimwEfqbnfTup+7aBmeT68v4h0oPH4Tqqoy
         xkYMF4H1iu2IDvWdkKFVAGo1vSMgceMe+q9dksArDf4D9+T+RlggZ1nT6jmeqIv9T3+X
         rYyjoj2ZsUtnlxmT91G9K+1jdE1J2mdbb1TpzVS+rjdiy24+8Vot2UO11Wyntan5kv7n
         4FMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795008161; x=1795612961;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+wKWXTICw+rK5bkgX4OO79DEF0MgQ4W42M/9WAyxMKM=;
        b=j+6mnEkAu7mE2V2KrAobDSXUxwW/T/dGbD1/hyrpzVHdE8tJmMu6PafoBM4aZBpNs0
         l64lQCF2mNZb4cXmcmX7hpjAyVcKLHnMfOSlCTJiE45gdNxNamcAVuNTYbusdWOzmYnd
         Ufb1RSUXNFeAVDKIwOWBeyx/j6QVxfJ/3y9mW+dZhnE2Hd/OIZQr5uZg3z3su7QiqCN4
         6rxH85Pm3854hX+RhXFnaiOn5KvgBK8/sxUfkt1yj9mYuMv0aebtonnAMk9aBbHRttM7
         NmxzI9l4GVW8ilh+jpdW2rYJpv3gGxjm/zvdRcXcYONfALeDfubP/5noIOrnLywdtIma
         luUw==
X-Forwarded-Encrypted: i=1; AL+hErFHe4AanaDzHMEYh7giQUDsIbubOfHM6MIk9DOv6NknOEIEtmf6knSB0/xO4zbkxNqnwdtUZTzNu9KjPnE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oKv4fXJYpEOCwtg9ADXxAigW/D1FJHcpfnWdoWxQqiQ1xyD71
	0VtQ2jmGhcKa0fFCVmsQhUfZOpG9fA1bz5SDs01QUbc5H2GbVtaG32My
X-Gm-Gg: AYBFou2h0Gj6HMZwk6DZuifB1jpUFitF9gDIpmJaG6z3k8MQ34CkfvmidoX31tPMnQF
	jrTk++HzNwik5c50M2PL27GQ02/IdD99m+jiGP9c8/YVyNd6vrX0o77osioY77SbdR/LIA2R1iK
	FUmCbj4UjM1PeSXivlx7RdIK6EiZ6FSt49T9XQ7O7GtmH6kAUm3GpjtDpGcHVnoiaFyvKji1Bi5
	eSh6dw2EjMHE8HgDBR5LqVoErQA2TTLhltHdet5WvsiRbi/5jCOMF58Ks59cZ1yTFSYdPNvAMFh
	CyaF4QIH5+lAgXikitsDZ6e+9M8XYjXxS+q+BilEb8YgibdohHeY5oiBbRZiWR43Ad0FOz3zXDU
	Bt2hkF9ndp+rRYpDFcyFyX3PTcF7Y5SVXyjbeyHRAQbi6poXSp8qHnsDoskD2OOabQvvvy5ILLD
	1JPKv1L92lsRkiyUkT8tv6RgB/VEKCVPLx4TYLPPO+YgqGGmbX4txfgyRTrWcKMGuKVmi4WSEAd
	8BdoSnUbX3xBi+Ba+sYmyJGWhNzW5w4GJeqd+4SHWUe3SVV+AwHvlHulKk9dJUfy3d4zvIQcjPe
	+/XXvzMegp45ffrSkVV4ALFFhk9b+QYoAPQNs0PPk77+UkBHHFenR+v8i6xXtuqh2V0=
X-Received: by 2002:a05:600c:6290:b0:4bb:6a78:7c42 with SMTP id 5b1f17b1804b1-4bb7d6cd48cmr51017095e9.1.1795008160593;
        Wed, 18 Nov 2026 05:22:40 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2cfce7sm67254185e9.14.2026.11.18.05.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:22:40 -0800 (PST)
Date: Wed, 18 Nov 2026 13:22:39 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests/pidfd: print time_t as long long
Message-ID: <20261118132239.600873a8@pumpkin>
In-Reply-To: <20261103155447.534264-1-sashal@kernel.org>
References: <20261103155447.534264-1-sashal@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  3 Nov 2026 10:54:47 -0500
Sasha Levin <sashal@kernel.org> wrote:

> On 32-bit architectures with a 64-bit time_t, such as armhf in Debian
> 13, printing the time_t values with %lu warns:
> 
>   pidfd_test.c:523:50: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'time_t' {aka 'long long int'} [-Wformat=]
> 
> Cast them to long long and print them with %lld.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> Found with a 32-bit build of the selftests with a 64-bit time_t (gcc 16
> and clang 21 with -m32 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64);
> KernelCI's 32-bit arm builds show the same warnings. The changed files
> build without format warnings there now, and the x86_64 builds don't
> change. The other selftests get the same kind of fix in separate
> patches.
> 
>  tools/testing/selftests/pidfd/pidfd_test.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/pidfd/pidfd_test.c b/tools/testing/selftests/pidfd/pidfd_test.c
> index 932cbd8caa770..a53e72cb256ce 100644
> --- a/tools/testing/selftests/pidfd/pidfd_test.c
> +++ b/tools/testing/selftests/pidfd/pidfd_test.c
> @@ -520,7 +520,7 @@ static void test_pidfd_poll_exec(int use_waitpid)
>  
>  	time_t prog_time = time(NULL) - prog_start;

Why not just change the type to 'unsigned int' and use "%u" ?
It isn't as though the difference is going to be longer than 75 years.

David

>  
> -	ksft_print_msg("Time waited for child: %lu\n", prog_time);
> +	ksft_print_msg("Time waited for child: %lld\n", (long long)prog_time);
>  
>  	close(pidfd);
>  
> @@ -599,7 +599,8 @@ static void test_pidfd_poll_leader_exit(int use_waitpid)
>  
>  	time_t since_child_exit = time(NULL) - *child_exit_secs;
>  
> -	ksft_print_msg("Time since child exit: %lu\n", since_child_exit);
> +	ksft_print_msg("Time since child exit: %lld\n",
> +		       (long long)since_child_exit);
>  
>  	close(pidfd);
>  


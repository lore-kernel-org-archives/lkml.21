Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795525772;
	b=b+fUEYJRW7chkpvV/I5AaB5NP+xDccUSbv3L/lrS64VKARpadRC/g1+jE3IG1/f/+sWq
	 MN0vbOQiW5m9JZeO6GsrgWHWFigi1Iu5j4TJywfoEyP66/loQNHbY6cMAdlcAHKIyPhSA
	 MbSyQGNZBxRV+gwW4cxxYFEZ5aHzmzWmHJ2w7VFiJXpb7kZgmN6uhQ95qTV9u/MggkoI0
	 fqyeFhVFynozrmPA8n2kRG/hrE7h7gVT42V5UzSk2I335jrlYeZLJtbHJF5JGekKbauAs
	 adtLN/FM5pbAgLjw5z/XjF5zTQCSBf8XbJVWC57JAbJx4ZWWqmXM0j3r8jCFtB6YBaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795525772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=8yG0hkfIb2fB7h6z4Ui2DUaPUWV2P+Yav+jRqgNw3xY=;
	b=wzJWxBACkzBv6AymOd2qCWr1XtOsHqj2WhtMnLG9bQq028+o8lIZ1G+oRIGLpm77B2Ge
	 9L6be+4rKeFBfxqgSzFj69o/ThhAflQn0NGN4WEpYmgmOlyXLmJCGwaQiBNYHs82irHli
	 k+e0OvdndG6FGEF4WGn/8hJC2yJGzvIhnfMR3nJSHMlgTWq7v3gIOUcDw4ZPo2C9AXfa6
	 HUR1atHwSnZJOMwzEtrvcBzgWKpIOrCQVN0Z3k9h2F/kfLuVQyqQzu4PwMKcH9fqQzeMZ
	 mKVhpVVM+Tzm0qBqHDsx4a+/mra3cIs0eEPUbVz549Nuj2enLmIZnJ/t5rHax3kMizg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MqA5yQ3T;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F13E606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F13E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MqA5yQ3T
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38699cf08dfso4912840eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795525771; x=1796130571; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8yG0hkfIb2fB7h6z4Ui2DUaPUWV2P+Yav+jRqgNw3xY=;
        b=MqA5yQ3TI8mmHn2+b38HkEvtgqQzyHR0LW8DcJXTREDuHsnh+pcBCLS5qcgW9iqHV2
         412CSNfvFaovfq9i+tuCfj/aIt8L8dhNQEdrOr7k0LFjsU2tLUqdjRWnMhZDN3K0bI1r
         p3ZHytCZYvFZEmINQuTqy0a5Y7avToQ9MQN5o/QoJXXH0VXe5B23SQCz1TH21u0sQ9Hg
         luUfv8AFh9z9SpGarPSf97dpEHiPxoqqMfB6PHb+pSEpI3f3BC5X8G9UmN8mvOv3khf5
         Cfc4H336Fuyrp4h76AoH70AcMo6GMNVAa13ncgHSzoeYrbHc4kGPR3+GMO6RswgNB/cu
         iPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795525771; x=1796130571;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8yG0hkfIb2fB7h6z4Ui2DUaPUWV2P+Yav+jRqgNw3xY=;
        b=iGEuMTAciVWQAtzrlbhX3eESOj1MFXwAZvCAZhn9A1RJp1QfAdC4CJ4BfgzDUcyzpB
         NiT45kjNF3R2CbBlWIpSwKImDTXx3OpzBwXyMlFeUtEd7hTSj9LvMfPrSN+63H2AR6H7
         7dd9XkGhzp/+X13M5bnyc16ttVy0e5RNaiOI3RjNTEoiU2f8YhDiPmxn/pY5FAroNGrn
         TwOVrdxMTcmaCWpcD3KAkwsvnA9vukFEdwyDo0sz0Gm+s1JoilQQ7X9Nkp1VMowm+OzN
         17QCriuyxoFxW8QPJzvfwI1m2QkaxueiJg4T3l7o4vl7xfUddwSrmkX5i44y6E/oTnm7
         zyqg==
X-Forwarded-Encrypted: i=1; AL+hErEtzuvtca/cvX3crlGjQuYkOPMOHlfDfzSdOXYrKsOeHmsK2VQeF3a/n44ZBnOKD/mngGH1AwaaidSAOhE=@vger.kernel.org
X-Gm-Message-State: APuU4Z96drHbHPk+SSm2J1DTiYmZTC5qznySn9CICMtaI0swFwta1Ij5
	ExtceOO/z2ym9+JkG+vre4lbx2kWfohXadfVRh0hvKOsvONV5EYtTen8KikKvzzh
X-Gm-Gg: AZFdTZf5Gn1Mh2bkbp/r2YPMl2WTqUX5TLtooTg3y97f6sXtPou5SOD02uMrF/V+sDK
	aFUv41CNL3DZ4FmcwvV3NnChAX3YQEeXkPe8icB0dAPKRfgtG/c0LaAf31+eIvMKaS/Ihnl3CO8
	NZyHnqjHNJHvRpwhijgsJ/06mbNe05XOJmUatqeeaIME2PnNpR0bRIbTx5YjaFTGHkPJZhXRIRl
	dGR7j6aWEXugWVQ6Z9DI5FZTzyK06kySBIO8AxvM6z1pQn7nNsp6in4c1O5DVrthDDDyx+qDuoO
	z8etdBmFQZIjaksGE6lHpyObmZq7MRIibK2QYg9AZp6tffBhILCB1lsqH8oWrzO+j/qy03EBqVh
	9tUsrKhcwemnZxp/xuGbiBwUGK8jGbGeWCM3p+da07hRiGAuGti1E9T2aE8I5UjjvDbWb3dWa3f
	GM9YLh60jZgq7WC3OcAZwcAkAzMvwP18jamrquj83gkZiE39p+PuNUaPM5f/vcipaEYOKcecTMP
	cNGkct0JRuJI8eQpFVFPgHFWG/lgYVlw6H5gQGfnN42D7lf+f7xXcCmINEBIv2tm72O91Mrp4pY
	uZmE3Uli7XqCpYTyE8lR8fiGww9E8qKk9TkZiQ==
X-Received: by 2002:a05:7301:6083:b0:386:a01f:a36b with SMTP id 5a478bee46e88-386a01fa8d8mr15606324eec.35.1795525771011;
        Tue, 24 Nov 2026 05:09:31 -0800 (PST)
Received: from [192.168.29.85] ([2405:201:8026:213e:1412:77ad:61f2:79f2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm50659886eec.24.2026.11.24.05.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:09:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] NFS: idmap: handle zero return from
 nfs_idmap_get_key()
From: mdshahid03@gmail.com
To: mdshahid03@gmail.com
Cc: trondmy@kernel.org, anna@kernel.org, linux-nfs@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261112162938.14329-1-mdshahid03@gmail.com>
References: <20261112162938.14329-1-mdshahid03@gmail.com>
Date: Tue, 24 Nov 2026 18:39:12 +0530
Message-Id: <179552575292.187304.16298525842648413199.b4-reply@b4>
X-Mailer: b4 0.16.0

Hi ,

Could you please check and give your feedback ? when time permits.

Thanks
Shahid.

On 2026-11-12 21:59 +0530, mdshahid03@gmail.com wrote:
> From: Mohammad Shahid <mdshahid03@gmail.com>
> 
> nfs_idmap_get_key() can return zero, but nfs_idmap_lookup_name()
> treats only negative values as errors.
> 
> Treat zero as an error to avoid reporting an unsuccessful lookup
> as successful.
> 
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> ---
>  fs/nfs/nfs4idmap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/nfs/nfs4idmap.c b/fs/nfs/nfs4idmap.c
> index 06b193722660..8f5f0abf804d 100644
> --- a/fs/nfs/nfs4idmap.c
> +++ b/fs/nfs/nfs4idmap.c
> @@ -353,7 +353,7 @@ static ssize_t nfs_idmap_lookup_name(__u32 id, const char *type, char *buf,
>  
>  	id_len = nfs_map_numeric_to_string(id, id_str, sizeof(id_str));
>  	ret = nfs_idmap_get_key(id_str, id_len, type, buf, buflen, idmap);
> -	if (ret < 0)
> +	if (ret <= 0)
>  		return -EINVAL;
>  	return ret;
>  }
> -- 
> 2.43.0
> 
> 
> 



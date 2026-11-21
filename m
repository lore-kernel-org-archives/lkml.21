Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795263133;
	b=fYGbwFhwvZplJPTEazxhnxkQKKRAUXw8BAoG3TZ5nR/Oww/PJJKNo4d6sJSM4na7fZv/
	 VziCvQRonbm6V/WXlTLsBaIrrDWH2zf+Wb7+YVUN83JhFLuxU31I2DJ1S9dyFJq0ae4NX
	 YyP379OBCf4k6YYCx56odykkDxBFcGZVsx8+18gthnVgxRhiA85mjFA0/Tzgc3qIv3qMi
	 c78TiKr9nM03dRH0GQjlGMuI9lZxVckuTN+vD7c5PqO3xpxwOWZcudNgYuDsEJfDWoSkY
	 zMTQe70Yijy99gb6XqVwK1j7f2rzewv7O9ZeKnyvSk7ZmetkOkLjkqgqoImDQlCMqtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795263133;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=lGYwpKC1fByS7GG5SknYRcbt4FjMkQjX/lb3OlO0LP4=;
	b=mMI9uAPPvehlV9UaqbfmvyrOlNLivMSd75xUcbnNQKoIPHTwvrC6qlvqWoMfnR0zTfqT
	 QdnZv14OnO8IxyWyfUVHwPbL2tbP0BcCrR+DHp6p5u3uj7QLCKBXb+HV3e9j1VSIwXmd1
	 vXg1jvMhbVn4R+QnZSU1XxPkhU80FqQbhg7XImlWZy64xX/8+Z//uua35D5IZ1eLFuNwL
	 dq1Uw3TIoUn2ylJqCEzmE6j3GjNd20FiIwY4rylxK/XgVpKJ7YJtu+w4d3x4+Y+drjBmQ
	 OrFeMX50bEjYLzYCFzo44yXwczo54v/1y6262EAhNNNsVnhwdFc9aAc2ZT85NdWf7Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E98606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 12:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5E98606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-55bd96affd2so37959701cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:12:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795263132; x=1795867932;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lGYwpKC1fByS7GG5SknYRcbt4FjMkQjX/lb3OlO0LP4=;
        b=HrNkGD7AXSbk8CiYGkHZncDL2twNhzrREYPzQLJd2z5mJON0FWvNN4Ob9yjn4iMzwu
         WTj129ITu+MQpJpElMVExnUUbsZexY7GUzZYRpBf9TGtN1Lk/u4MjX/lj++kL5sZRSWJ
         ZdGV+6FzViywGA8wvz9B2JkQMf7iqT08wQ683F73F1B0qWTWRn6947WZ67MdcsN8hN74
         oG2vGjbrPH5sni4uMLs4cLXWEEdfZbSYk5rPgjuj+743hmFHZWbK8ALP1oiwlDnkGdz8
         Nz8fxpcEjTqfMh/aEBmPgCk/yd7UiDW2mhy5HxZZJEf/0ubpc5YdI71IiIDcCOHxyHuF
         AC9A==
X-Forwarded-Encrypted: i=1; AL+hErFqol2/V7tNeKfQTmLkWbmouUb/1cHebbzj/zpLtCTXNxW7gpH8svVI5rQCbYpdhPi8aZLnfgNSKh3XbKY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RHeGA0+LyAuo8pAzdsfDktmbcMDi3e5peLVuNLbugui6g/BfA
	Is0T7jht8L+VLm3ub7lUUOBNP6oKoPvNDClFjqKSmS9mUEw94s1EGT9f
X-Gm-Gg: AZFdTZcTzb6MRDHV9wIH8WzlN/LfW8NYmDDghA8viC+PQUyYegkfhcQU31HU+GXrZq7
	46xoItrHNrmHCWwB8FKB/k/9WHstgQoxc9jZnC4ItEhRE/sM1hpesR82Cy9kOSSJzC37wXAFFEO
	/ynqgXDrm5UuWEVs68NlM2WkszAuPAiFHlIM+1br6pEckrTEtLSCIkDUzD+27Sqz37TAkg06SFx
	hM0j5LfSFshR0I5XQxS+jO67qB2oRxwUPQHDZ82OlLH8EayT6i7WYvHpr2q3el96XVRSqPDMbgi
	Gb1xBs3TBx7dAVQVY0oprUuPLGrga38V26YD55ajnIJ+fdwWK7kQwQ7gY1rksFXVX8Fiv+LksiU
	uEgkU5s2rrRw+WBzMYY0cCoIxARORAg0s0KzRLTJr08q6rsXgPqKTUS9w50h0pkV1Rxcft1bLHX
	/OlJER2Dz2Z7NvsOoet3myqtskBiHLPREsxk15hfjFoGyBODIHtkhJ0q4k2RLRw7U6+g5RGxMuw
	BeYeUP3WSZBDjMzyfSlH3QlC05+cxlLs3pYJmQWJTIqVBDDIgidHvvswIWH5qRIX6nLch6J9jyx
	6EwkE5v1qCKUcPG/Nzs3hx3YIy5Obmb414TZAVGiSJZE9yMmBYD87dmhcal2SBD1vU1mlp+baDG
	ZY01YBMFYxVMmKkngdOXqpVIcTzEE/rv5sIGCuEf1fLzrC7pv2teD
X-Received: by 2002:a05:622a:2283:b0:55b:9d8d:f29e with SMTP id d75a77b69052e-55d769c6d1bmr89159451cf.9.1795263131897;
        Sat, 21 Nov 2026 04:12:11 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d78812968sm48042081cf.9.2026.11.21.04.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 04:12:10 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, shuah@kernel.org, xukuohai@huawei.com, billy@starlabs.sg, void@manifault.com, ihor.solodrai@linux.dev, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, awerner32@gmail.com, andriin@fb.com
Subject: Re: [PATCH bpf-next v3 4/8] libbpf: ringbuf: Add a caller-owned iterator
Date: Sat, 21 Nov 2026 06:58:00 -0500
Message-ID: <179526228002.45024.2428180539629576513@kernel.org>
In-Reply-To: <awFr3R3DPS_so3Pp@gpd4>
References: <20261120-bpf-ringbuf-fixes-v3-0-ff7ca15d6c37@kernel.org> <20261120-bpf-ringbuf-fixes-v3-4-ff7ca15d6c37@kernel.org> <awFr3R3DPS_so3Pp@gpd4>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

> Can we make this internal helper __always_inline?

Done for v4, together with a private __always_inline destructor.
Callback consumption uses the private destructor; the exported API
wraps it.

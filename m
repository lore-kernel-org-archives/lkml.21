Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431285;
	b=tJOFrsr+R6rz8v2l1TOGTRv+5BcHz9yISQLu6XltKoo+VhiMwhoIngzyUbn/sF+Jns9h
	 BKiTj4uH3NWSOQgwShg3wi7S2lKvGH1xcXKHM8VWgzmADeKGNhTIjC1eFlayB3nCJpfDl
	 QW7yHo1WI7xGLvDhkv9Gofnvm9r85pbD+hvR/rPNz+oo1XtIrm4Jux91S7PgfJs9B+Hwx
	 RsEqVztu4/pHdrGH7iu8F9ltOXVjh8zQZBVYDKFf7bbmTwT3iCyoFKUxucr0z3qvS3I/O
	 dqqGmd9E0Mk29x4aLxJMRxxFuyoxKLjphhmVWoUe5CGBfKmM2oXKzbsdxMHFA0YkD0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KCyyvoiSEyd0eyemfSZuFH09Xb5bgsjks8Lk3a1B1RQ=;
	b=pIsdp0wBsQMOx2x/KcHBMidNU2Tb6NYRkmF/wMrmw12JfZ3xN+vUgDdrqpVrAvb5qrD0
	 L9egrLy8q0xtGXLf+kRP48EPBQMqqqxlmNY8H2b7EG0o9DOOr/TVeBYqoWNQIzvefx8t2
	 4WH//LcG4OsBgcc+LGcQiTkG56Ey1Gv30K4evnnxJLWfwgno7Ex704bUTjJPbvDTMuOP+
	 DMyl9uX3O8qCpqpaiIzWjG/3kGJrrwG+u3Xo2tIC2+dSkFPu+RFlLA5zzPjj9kLYU6Xmi
	 3w9bCVjfjIAJaDFwIHZJFuhQpu0lw515/TyAqXk1wmy1wtuyvkJ8VGMECpVNNkxlzMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qRmi0yoQ;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF87B606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:54:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF87B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qRmi0yoQ
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4d427836e9so431589066b.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795431283; x=1796036083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KCyyvoiSEyd0eyemfSZuFH09Xb5bgsjks8Lk3a1B1RQ=;
        b=qRmi0yoQ+uzCzxotO0Ibh2NIKm8hjU9kqCxqPpYHpCIxL4z9fDxE8e0i4qw/EqrdxM
         TkPtMZB0BeTOABui0Kj4V630nrzM1IxxaCGeT35QLWy8XGbMCoLM2Z17ZvKME7f88h0H
         H1dpFsTkYcD7uvEv0lrYm1gFZL/rL6ssmxxDYrx1AfZuSRynpG7p5/NmuZOIfNhixci5
         MSr0GZOLsR+4zZyX1g2QXsQVOiexoZ6525O3ZaEKKDAW1lIv2XdSy+UGXA6wVr0uq3Zk
         3K/rt6M03DBv6OIfFfH+62XtrVA8rlJzj2sTfbIoDAozEDWFf/lPemyIdDzhKqJvYYrl
         kE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431283; x=1796036083;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KCyyvoiSEyd0eyemfSZuFH09Xb5bgsjks8Lk3a1B1RQ=;
        b=oGOMcyZKItP74PKhJ5YAhSXxa/nLtvHLYWp/1Hc2yqOr3gcpGCn1bub70l8MIUJQo+
         0UwXR6BlZpzEoddzLW+hV/fbvWk9c2ueD64Jc8aZVcJ84e11RFWYd4WSuSPq6QAE6a9S
         xDWyMIwSRsG9GXquE8CzsLAQzcLpk6o54rbqoSgvXDz2NUidHGUWx9N7fURwbZORNvaF
         R7TGqU6rJb4l4EkCVABOXxW72KDLiVu/vfMj7P5WNzGmaUi0y6qgq9aOYQnIU8LObCjy
         SD5DYoDSDCCIrP+h1ndxbugVsLaJGMEMULwToeXtd2cCSh2kd/0IQVkLDABRTL406BWd
         3ygQ==
X-Forwarded-Encrypted: i=1; AL+hErEgy4nS6CxPNrS1bOyTIL9OaMvbuywtH/MUqB8hej10rM27LiXEXQylruBSwHcSMeiQDQXbLfz8cyUbsZI=@vger.kernel.org
X-Gm-Message-State: APuU4Z87eNn2X5yM+RgU0ThJcNdEnNFZE0orI5ooilfflZoBDRrlE5X5
	J9xuoe9jBEJlgonPG1Dr/bqnC6RF3UiNYhc7xd3BDErnpnnFRHCsq01A
X-Gm-Gg: AZFdTZfD1vMNssZI+Q2Z2/HSegenpbXgeSM1P1UzYccxLTbz9VJ63szkpU7dqOFET1R
	JbM+5QfRbArK0fkRnWmCxG902KWrxg18jFP0Z0Myx5tu6cycZuR1e7Uk5sRXZVdtKEXSInyqGGf
	ZHh4+ep3pL+LHpEYU8AsPKht+QA6zE69nisty0xxXUC6kSufM2j1WjV8NvYWZMjgC3FfDtSNQJ0
	ivaTyKjvI3PcBM1lxH5mcDxTmVFPKXWyZin8qR/i+mGbjTVsYl2DpMLaATvle540Oz0+TqmkPh2
	LsIR1/SgU5PyZHmINAOvuxgFxkgMeE4aXkcD/dJzncW977722yD3eGSnk9DxJXEag7bcIZQoyqJ
	u+UDrz+Hy4D+5H13x7Qu4sVYDujfaXJC1V+V4pS1sj+rLdoiOg/vp1xaJzs4rWK0FncBxj4mxOp
	UsgPjzeViGqRrGI6wHe7RCRIxxY5a8dI+TdCHBqgG1AW4rIvmO7DL64sDvWFMmjEoQl4v/H+hBM
	lm7tOBPCropcM49tat9P1ZkBldEwHWBtYEop+1kvof5n2qTyegcl3DsH+bHTLjQqQHuhmF0pWRe
	vAuzXTs16zqT6KRMjiS1Hl1IQOCg6DnEGwxD2Fk8K2H5WXoQzLhbuEPS/ya0dYVfyvQObNnfzbS
	Rfn0gBz02v8sVwvdkdnbin2TX48rgUA==
X-Received: by 2002:a17:907:c17:b0:c4d:31ad:9dd5 with SMTP id a640c23a62f3a-c513ac86e26mr918793166b.42.1795431283107;
        Mon, 23 Nov 2026 02:54:43 -0800 (PST)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc73d3sm384468766b.64.2026.11.23.02.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:54:42 -0800 (PST)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Mon, 23 Nov 2026 10:54:37 +0000
To: Jonathan Cameron <jic23@kernel.org>, 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH RFC 0/5] iio: split struct iio_dev_attr into typed core
 attributes
Message-ID: <xx235ezl6b2hopaaw6cb4o4rmz6tqumkatnhcg52sv3ooebqtr@klqbvsrlecl6>
References: <20261120-iio-core-attr-review-v1-0-05b41f8133c2@analog.com>
 <20261121013907.5e15d2b1@jic23-hlaptop>
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
In-Reply-To: <20261121013907.5e15d2b1@jic23-hlaptop>

On 21/11/26 01:39, Jonathan Cameron wrote:
> On Fri, 20 Nov 2026 18:03:56 +0000
> Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> 
> This is missing key thing for an RFC.  Sentence at the top that tells
> us 'why?'  To me this looks like nice work with no obvious outstanding
> questions so not RFC material.  
> 
> So unless I missed something, drop the RFC for v2!

Okay, will do. I assumed that adding the RFC tag would make more people to
engage discussion. I thought that messing up with IIO core and introducing
an internal architectural change would require that!

Thanks for the quick review! 

-- 
Kind regards,

Rodrigo Alencar

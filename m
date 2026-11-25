Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795579097;
	b=IpkYVoBjOe45hYuywByysOB0Vj26VZ8hXKj5eehmRW8HkH0Ro/m40nlKZXExkkUgXDRa
	 Ix8tqfj8Ed4Ao79gvy7jdStyXiijFMvTK8DbpaWNwygMuT/dfiefPFCmv+ccIn2EqzCTU
	 oBBTeJM5KMhrcxfnseecWDuWKR3Y05iegXrt/k+HCFEM9IYAlY3SWa6NMma9YYs55N82U
	 nSUjn2n0QIm9mjZMlXA+UwrcKa/Nt2CWe5vPyyJNGLmD+b54lplKp8pNFsHRtrv1X39Fz
	 q8ZWwAdXRuXnX/U83IpwFZ1Duv0Yr7rwYVFL1aJx1QgMH+dGgyBtMfMl9dULIEfJhCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795579097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=w2GcGq8IeDHEJo2hhv/gnTH7TQqHvIsjQUqf1AKZb4w=;
	b=J0dju9wSWBOHaxRX63pPL3PMRwE0/gBTWl3u9zi1tbBCXkJlTyYAAvFqErPOjzyHHxa8
	 oLcyZwowobSQetN8GFohzj9nIP/hRRT+adjz1rNa5g+5Ms2WeOxkQvr+eUDohbyLKux2j
	 65wO94XxmMPfYx9JwcemrdGkezZiYiReJjrcbH4EOjUSQrNg3A8pkRXnSiT0waWArA8XP
	 8GgGCVic3cG7HcVkQP9CwB8kRCEgNjB1z+ErjTzjr7Ihu7nSJ2k1Eg/nDF1XbjbGKRX9O
	 No/0tQnAvId+YX/tIueZrVN2CIHzQYnng7j7l+eF+86A5vZIX9slUqAFLd/7Zu4iA2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="F/1yAGIj";
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8827606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8827606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F/1yAGIj
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f041f88577so29138645ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795579096; x=1796183896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w2GcGq8IeDHEJo2hhv/gnTH7TQqHvIsjQUqf1AKZb4w=;
        b=F/1yAGIj/vcfN7GxWSyHI5pxXFN0ejhz7qzfGjsqQHA2+2JR2IAaROcSBAfpzzzxWO
         BN9JFLF/x8m6OSL6w/5Sm5s73ZacJ1/WVYaZz1NNVZndrqx3M3F12apLSAuTMOBOLF2Q
         Y6k8pe6IEUHaGveiTj8UYrQXllDitfggHo3RQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795579096; x=1796183896;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w2GcGq8IeDHEJo2hhv/gnTH7TQqHvIsjQUqf1AKZb4w=;
        b=zW3vpy0X8R5Nnf9MBQkEV/1Lgh41BQV4OVUZGwYetBPhUKBbLfx3jSpxJ6iGlF5llE
         havtuoX7a2kLyLNbESayL3WOnmSuGieevTX9eJA1p+epCYVJ7Utcktf8z94kLDG9m2El
         rUBZRw0+KnSEKUobfn1sVaZQI6M6bVR0g8teaUGHD9YPvFVUZQzPX/4hHdKZPSUUATBP
         qlfEYJoh2xj6JEtxedwdVyfLK349LGw+3M/u0A4UCZw1duR5WtLbevg7AfihqFX7xyHN
         zqGjlLpQMJr2Ij24297IaS1EGVg32Hcp78dR5Co92CdW4gLJ9dv5VEkJschaLjNkgpjh
         Pz0A==
X-Forwarded-Encrypted: i=1; AL+hErGK7TlP8f1LBD8jWrdqpp6sQ1Ifc6D/l5jjDcmNq9hbbxbU6IO8d78YgdY+S5Gg+Rb6/rxuUBnaniS56L0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+e5+SH2vmemamMF3u13yF/q/4XGXivo7M2616Ca/RZnZiEWoYg
	JH8x4n9nYLayIjY+MKRByHWmGBXWM3+4Fm6x7VsUAuWXtArMT+t815pE0nJPfecQYQ==
X-Gm-Gg: AZFdTZcLhoQvRnlewbtASfNpdl9w42dteQvzm1UyHOxQtw3QQTDG7U73yvEF/4TsczE
	0SmTgXv/j25lJGzogu9L5qzEELzshjpvAvJ/IflQM1QSvsqCMPAfgkGUJS5NYMx20uXXzeNsrww
	xYitPFChWrYlqw+FLMTdVncQomXbul5q+JucEVVMjloy9nJDClA0jcT7xUDhsGhIjky0osB7UXr
	DYWb/4z/K32aCi6CnBTwEYzTNQNT1w3fTlVClAjUGWLs1AfsQ5GAGeoFpz+yzsSGTq0Fbnngirf
	dJUmL4QCZLK0y12t6sgUGGBsE0zamBZmraPjw7+y+nkS9nXF6pvNEfRw2a2a2zHrM5+PKBCCqUE
	s3wg0q4sS3ZFSVij3yfbDctqFbA6kkFgUbPwcHQvrNOHCO4Ecg89kK4zEwv8owYCs0Rl+iVo0ML
	OBEIOM/E9sXfzkmEJQsCu/Z3i6wkVm1EKAaSau7byMvsS9UHPM3MHpsFgxKqs2hpaAwR3diyHyC
	67I3tu9K+FWvIMMap/QnT5xcaTKaGjUgpHY5hJMhT94xwRPO+6lIdCAqdfORyrKWvDiquDTfof+
	mPhXfhfd+Ho+ZUBYkvHTPekXe3HlJeuK1Qhp69ChDtDgfLZa+/LfbkdrHkA5ADIe6NBRvA==
X-Received: by 2002:a17:903:2984:b0:2ed:e22b:77a2 with SMTP id d9443c01a7336-2f03f1ea587mr159665435ad.55.1795579093844;
        Tue, 24 Nov 2026 19:58:13 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:46fc:328c:bd84:94eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c2ad2sm77813365ad.16.2026.11.24.19.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:58:13 -0800 (PST)
Date: Wed, 25 Nov 2026 12:58:09 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Yosry Ahmed <yosry@kernel.org>, 
	Hongfeng Chen <hongfengchen@xiaomi.com>, Brian Geffon <bgeffon@google.com>, 
	Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH v2 1/2] zsmalloc: free a zspage's pages in one batch
Message-ID: <awZcfYOQXpYLcZSp@google.com>
References: <a74aca7a3d27333972782b29786c7b33861a56f1.1795412161.git.senozhatsky@chromium.org>
 <CAKEwX=MJJVBfdE+LL-j+jwfkNP=OHaV21XLJxEOBv4XwsBLiiw@mail.gmail.com>
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
In-Reply-To: <CAKEwX=MJJVBfdE+LL-j+jwfkNP=OHaV21XLJxEOBv4XwsBLiiw@mail.gmail.com>

On (26/11/24 16:16), Nhat Pham wrote:
[..]
> [...]
> 
> > ---
> > +       zpdesc = get_first_zpdesc(zspage);
> > +       if (get_next_zpdesc(zpdesc)) {
> > +               free_page_chain(zpdesc);
> > +       } else {
> > +               /* Single-page zspage, e.g. a huge object: nothing to batch */
> 
> I wonder if it's worth keeping the old logic for incompressible case.

It does appear to be worth it, it's visible in profiles.  Batching comes
as a win for multi-page zspages.

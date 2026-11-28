Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795857527;
	b=djAek+mx/PQ4zzi7OeEAmktcjcmGmzCBQ7KMIFUtif4VM9AhLjcWXnsxw4JgzenoCo+t
	 1YXqaQPhl0MRgYROVOgoiBBK0ANX0xcveVAB5tvMVKYTtchayiRTNAfbSlsoLzxK2kTUq
	 2Ld9Url/TSb5jlqipHhMUR74kw7WYHD+gWyCrt3wd0SuLmA+vHBdDt69aqcgi3Nvs5LMz
	 EZSNqaNPwwXuZKHcSc5aXYJdUODtbLZ/d4JoLtWcmBMAaBOlyEScGdCoOAZVp9jkPZC1M
	 rcj45Oq8mJBIy3ENdAzJklVd3dLvylcWULkmVEE4701RONy4S/AGj9aeguGYB0xpi8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795857527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=QHBi/kFqk++CZ+SPDTCxQq76agXRbZkghzbM3h1MwDA=;
	b=EkxhEbkOoIB3wmQc4mIE/HXARw2PIhnCHiDXy6XhmLEhU+TtrvJH8MaFaqTKsgVj+zyi
	 zrL93sjmlMY+yLG47o7WegRlbjLN0ArK+dJmxfQOXcVcH/EmUGafgnXOb4vQrJ7vcC9yG
	 e3UJnsFtXujtTtBEmjbJl4+YlGcnXGY9ifo0CvZvmdLkPlhYloT+mFt8/+kFACUpssbAB
	 0+XkwJXZoAcVM0ABHrIo7c8BekdDcBgZSp7r3Ac8AoZ7BACGKt9u2EDJ6uMbxqwl3QcO6
	 tHbXODQHLoyrJondOvr/BW+2mqHqEAJiiBao1GSTVZoJppG0IZWs7sGzqIBLbd7wjAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qfwPj9vc;
	arc=none smtp.remote-ip=74.125.227.203
Received: from mail-pi2-f11.google.com (mail-pi2-f11.google.com [74.125.227.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE67606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CE67606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qfwPj9vc
Received: by mail-pi2-f11.google.com with SMTP id 41be03b00d2f7-cde795fea95so2290725a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795857527; x=1796462327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QHBi/kFqk++CZ+SPDTCxQq76agXRbZkghzbM3h1MwDA=;
        b=qfwPj9vchvVNjqffu/2Q4ek0v80MK+yha822ZDECq49xZAo/Mj3Pkdyvd/G1VZe/Rt
         deyxNHXI+CZgOSgF1zYGzDXFeWxavtJdQK6/WvQmLO09dBAi5aO9EYCRjSogtOXQQY/0
         TqRKHxY7dHFtfZajCp4aU0ACdhY+Q+S9MzPfVEjs6sSum3Ioi3VLhni2jKw83+mpHQiT
         /TQEMPl+aC11LSOpIrY1ASCU8ULCyS4UX1d11HG6e016N7VoTFed16Lw9+ERNZ4pQZku
         jiUNg/J8FJDSRjgK4aHBXmMmupUvb9LG+L/W+twqCFzDf+vLDTkfEi2ikL81TwManYnr
         XCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795857527; x=1796462327;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QHBi/kFqk++CZ+SPDTCxQq76agXRbZkghzbM3h1MwDA=;
        b=pj2QNFTpJp02B+bUJAUSptU8RC5g8sNBzTQM/ZMaWxMkI0kIEKA7+1k9R+d/37JWLU
         anf39iG6eT1zl15eI71gz2rB253SpxPwGOwmdG9Hr1b+Wp4qOnetKsd7RfOomBS6nUP9
         lPgbM4bsL4hxVNSyqV86G+bAR8TkQDeQxZ+98JzdGob9Y8jbHE1k4FetoT90vUuzanK2
         QwHPBWv65LOZ0SWpVe8/ywR+3nGJbYplvP7cdnucTJXuQj9J+mrcGrW+5dWAcjsdoffA
         KAqiypLLoCxf+LHGd0W9KIv9qqbhyYJd9noRlOcrPQOlhogrm2dLx57nOhC44zlLuSSf
         czyg==
X-Forwarded-Encrypted: i=1; AL+hErFy+oZoU8eqxX8965LNBUH8QtUPTHGqzLJ8h9m5UVd4+Cn0TC9MDmw00qjANs7Qr+TTFV/XnC57S3Wa93c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+TWLSxme7BJECws21T9hxv3R2KjCuh7jOr7DCTcsXRhd1a7xd
	2+hUA7E4XgZbbjZ3T1RWIL/GgnA1oJwNao2HQfhnHgfmpXTn6oFaa4vC
X-Gm-Gg: AZFdTZcbXWqFixBUbA6lCyCtZFmcSqEstgMQ6K3sbdkwh0RVUupd6BGx9pGDj6DgnBJ
	GODC/YvW0Lasovw5/kYDSxlSyi3rjPQ/1J6qJZyQPaQO0diTDvBS5bqk+nywegS+AetBPOX+MIL
	d4nkBdYOvtnglrkpxD7oMrf9/oGmLub3iuQjsS4It0jqZry5J7MYayPIBpd3E4UezehjHVN98H3
	eGK52kN1IBSg6Eb349aPpyGlw4Q31Kdh8cD0Xq145Rj4cBvQgzpSXIva43LOtcd1Wfj4vrO+8Az
	CKmrG/sZ+y861mx4z9JmL2tVnRR7rGKaAbtDC+ujjyrDL8VGVzvadYHqirWzKXRY8j6/0sCNrjv
	TcuyNCWOvO1jVpwvOviL8gTSRLx3pScjQD7kPD3uMrAGjs3NCCdgdaT1OlvpOEP4AmbPXSFdoUv
	Jymyns+1iipWTu0+gdFFkmjMBUAJrUK6KjtO7mczpE4ZnIot3RGHhPJCw+Q1rDXUtwOTqKkexc0
	tgAqRdDZnRFJRL3nLB0qZTLoQUEFE1qcVvVa5JMK6sYiD3cJKlrL1O9JKAPuqvkS+vRNu2DNBeK
	ecOZmdOoF6uOuBjXZedVsJUkaz8=
X-Received: by 2002:a05:6a00:2e9d:b0:880:849d:c07c with SMTP id d2e1a72fcca58-8c87c29172cmr24528688b3a.25.1795857526632;
        Sat, 28 Nov 2026 01:18:46 -0800 (PST)
Received: from nixos ([2409:8a28:ae4:7f20:c549:2fb1:e189:bced])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873f16b41sm14070618b3a.56.2026.11.28.01.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 01:18:46 -0800 (PST)
From: Zixin Wang <w1355457260@gmail.com>
To: dzm91@hust.edu.cn
Cc: chao.liu@processmission.com,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net,
	zenghui.yu@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zixin Wang <w1355457260@gmail.com>
Subject: Re: [PATCH v2] docs/zh_CN: Add core-api/irq managed_irq Chinese translation
Date: Sat, 28 Nov 2026 09:18:29 +0000
Message-ID: <20261128091829.983996-1-w1355457260@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <948a8c4c-8899-4393-ab14-eb6eaebb4177@hust.edu.cn>
References: <20261120160539.103773-1-w1355457260@gmail.com> <948a8c4c-8899-4393-ab14-eb6eaebb4177@hust.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Dongliang,

Thanks for the review and the Reviewed-by.  I have sent v3 with the
unused cn_managed_irq.rst label removed as you suggested.  Since that
is the only change, I kept your Reviewed-by; please let me know if you
would prefer it dropped.

Thanks,
Zixin

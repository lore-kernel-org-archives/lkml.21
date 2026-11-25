Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616401;
	b=UrJhj6K/5fqr9IG2rOZFVM4JYC6+lPGN2AJ3JTOfep03w91m58UNkLePV8168sMiE8ab
	 t90UF3vVH/+q0GUTJf6JGeofD9Je6G3AaLNnegtW+syKgHUgFPsc3HPINhlMUnNF1HlxS
	 ebWWs3y7WlfsPiyqju0GmSVx+hqI37RgEVIYC+mYBFDSvBhWvMBxkfLrHhpIWM2/kOrXl
	 9tBVddSi1c0mP1uqyHR/Pfh96HG9+f0WcTjcaJFhCo8xCj6Mu9gJ3uvbum0gitAYNMd0S
	 9FjRRcQDuE1/8naEaiJ6ZSOOWy+xkRs9Q8ZzijiO49zJ7pUfyPNRqIAcMYzqaUOauxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=OXw3aEY7EdNjDs9Hr7OeVs9fvmVPov8tyqpiU1M9Iew=;
	b=ROftVopI5AzSAL1Y0d6XEXaPlmq852bg3fbAssLoD0fU4W4MfHf1I//IQZQrYWbog3e1
	 Kv96q7RtpMKpSVT34rTZkthq21SMe6RptS1FWeQio3uEDTWuRjp5FcVoD5mov4+abGNVI
	 M/RxISe8fDrb4iZnwAEtarZWeSd7rnzKjfZn75fabr1u2jLrL+sp+Cz+6A7Qt6BmAjF2c
	 wtU3M3Ffa7ZNLTrInHF9KSSjyuMjiLhOKZaBZKCE45juClxLeIxBBLMjcJT8O2dIw/hpi
	 p+BGrhF2GLzIQLOqDK2bx7QMq4axy8L5Jsmff0nqmJiU36QWZgr6WD+eY78+/zCo6bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eg2zd9Gl;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6AE606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:20:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A6AE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eg2zd9Gl
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c516a192844so539316066b.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795616399; x=1796221199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OXw3aEY7EdNjDs9Hr7OeVs9fvmVPov8tyqpiU1M9Iew=;
        b=Eg2zd9GlqLRBwDzyg/AOkaSPlGMQ+z8bkz6FeiX45oCMLFDuiEKc+1iCjq3aiw5kix
         sHM8aKNfvS1jKrcIomXL6e/ofWmvjHNXO6tcUkvGNyls+jBX5nhgrxdY5DN351ZudV8o
         EZ1qUgYf1qbYvAJ8PxRD8+DcsMipVnEvZWm+1UKa4X+YqN5KmIerIU1/oGfkm/BIUtOq
         FvlcZXt9RF3+4sKN7o5W8kpNd6a89gQoN5R1ggHcSH8iMMrndVREE2FJdI2AJGJ/+SIm
         EJEUn9irDIaln/kxrVmKIvt+BKskA0yPeLjogLUJ/aypZK+cwdxu5pH5ZCWhJldwRu5s
         W1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616399; x=1796221199;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OXw3aEY7EdNjDs9Hr7OeVs9fvmVPov8tyqpiU1M9Iew=;
        b=Id4Js85UuAJ+Q+A9Hds/RMYkwff5ySqNvgIveI6YQkFegsdKgHgL+X8+sQ2SalsPZq
         +nLf7nqZqW7ipQO0Dh54jxucm5jrmjHLOwkKjB723UPlnjBCE8m7fg91OQkVDC6OU2BX
         Wd9wpI1dSSj5jvTRGbFKrFtz3VQoQxflljZukuMKQum37CW05DxRJTcwv4msRgYSUVf2
         oUbSc/HC240HtlARF9/PDSiMFwXdG3PrMDgFqEJMsc0ECotQPDNwunIUBc3xJ5K3Zhro
         OYJcLs4a7++pkSQwufYI0yEPp4mE2rS9CretihKApVRrj+XUfZvTJcttaSRYJD9cRnyg
         ouUg==
X-Gm-Message-State: APuU4Z/Bs9Ipbrhvqjx+o6BLirc6GlTh34yiPmp150wE6O7tmarLJ/32
	U8DU0vQq2+HGKrmbITlJH9q/U0p/FbiKwxEhyTHw3J9tQQZIqf2nWUh1
X-Gm-Gg: AZFdTZfEhxyOIlHnJvt8aGC1tcEZu/Ge6kYfLs7q/ELgFh2zP5kpYJgXW4n6qfCezk2
	6VK8jURHztV3a5Jb3gYhmT3mk4LfEQ+vEVCXmyEcbW/2dRHk1DvMeNp8YGXxG3Yij115xFdOyBn
	CkB8VvUtt529m9NatbScLZ4TrM2aoRPAB9RNFH9kmBE9kKffmiQ8JbShU6mW2Y0RCQljRftG/Dq
	7XY/p8qUun5Pvi/5scaX/TLSMkpzkA68L5ix80Wk1F6cfvxjh1tQloMbAOjfMi/fQW4G+DrAWFl
	8D/Lh3JjbNwYHc0bQkLxxosV0kfttqOO+pd0BXiVlxdHcIKreqchETeuuM1oahdkck9BrRej3Ce
	1HP3dzHvx97vf/7NaruBTgUWxsQcHTbRUFEjTEEBkCLP//ObHVWPjkOepOqHLYYojwYnhkwAN9p
	sMji+27Fg/DBhmwosF/XpHxE6C0rkj3bCIgWxWUTM9R77GXwIWZIPNWI6eGZrm90qTNTHLqT3ic
	miCNnURC/w0hRrtb+B7WndMUFeECQqy8LrYW11eRnES+gqm4mDheKERgxbgDbr597fWd7G9p4L2
	wLBStTbfFZ9J1NGUTrJTuzXDqnFvqei3riE=
X-Received: by 2002:a17:907:da0c:b0:c50:5545:b66f with SMTP id a640c23a62f3a-c513a803353mr1371674066b.23.1795616399382;
        Wed, 25 Nov 2026 06:19:59 -0800 (PST)
Received: from CachyOS ([176.88.126.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51a161e387sm123379666b.47.2026.11.25.06.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:19:59 -0800 (PST)
From: =?UTF-8?q?Asaf=20Nuri=20Bertizlio=C4=9Flu?= <asafbertizlioglu@gmail.com>
To: jgross@suse.com
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	linux@roeck-us.net
Subject: Re: [PATCH] drivers/hwmon: Remove wrong comment
Date: Wed, 25 Nov 2026 17:19:10 +0300
Message-ID: <20261125141912.120978-1-asafbertizlioglu@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125121643.25427-1-jgross@suse.com>
References: <20261125121643.25427-1-jgross@suse.com>
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

On Wed, Nov 25, 2026 at 01:16:43PM +0100, Juergen Gross wrote:
> In drivers/hwmon/coretemp.c drop mentioning rdmsr/wrmsr in a comment,
> as it was incorrect in this regard.
> 
> Suggested-by: Asaf Nuri Bertizlioglu <asafbertizlioglu@gmail.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Asaf Nuri Bertizlioğlu <asafbertizlioglu@gmail.com>

Thanks,
Asaf

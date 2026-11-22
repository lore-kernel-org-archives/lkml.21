Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795387516;
	b=c0tHs3xST2bYvvfxNJnrQL2L7oj9hb2PUsRMsTksBZ9gcHhunqMUW7tIPqW1fub21jgl
	 9cLdSYJGdW5qBKLa2xrsCmBmPyOpIfdHWvJlwYLqWs+tivehX1louGpFszIruiIbZjl9z
	 A9rFAVDByNI00Fmpaq6CrdNOS0aV1D8ErxBQ74UHUVtmgTNdQPkSOR4cD4VSubkOf+zJm
	 24NVskyQXVBeGBMSwsCA6PeCpKxA+djZMoN8BhU+CnYEWtlM6KlULbs6m0Deih0hLowUp
	 Eo8jRGdUVivW6XC3LFKC782LUrgG8rqBtMFHW7zVRMxUzDeyN2dgdW1iPevWeWc7IBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795387516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=HHNnwunxwLQLJ/oTo4GJ8Drx0pX6nCVu1uIdTwZx1a4=;
	b=fF/XjGDWiC9z/n9ZlisOBYlJ6L4Cc8+RbAKNI9UveBXaw83OHMMtU3fETTv7zCyAcsEJ
	 EtALRmswyHv20pSHqS8Rp/vy0bEd+EIFj58xG3MGJHm61uNT8vV2t11TfBx1Y2R40kmeR
	 d5VAfoaHKDtplul8c+Oht0BGm+szsQLQ3OZd4Z/Mw7Wq3u8Z1m2YArZkuCnwHNOG6JEUt
	 1DN+gY9NB+smOCQBVf4B0ZMFPPq9E6f50WeqYkoAPZeywI+wODfzutFzgmfkEU51G2KGh
	 9z9znuzjSi0cJWuwHLJfBqzWE/rP3yfLlZuoZx9mfg6ERJpZFSU+T7mi8+ZZlKC/cAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gl9aV3Xj;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC61606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DC61606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gl9aV3Xj
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38692f62b22so820539eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 14:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795387514; x=1795992314; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HHNnwunxwLQLJ/oTo4GJ8Drx0pX6nCVu1uIdTwZx1a4=;
        b=gl9aV3Xjon1BGtoe8I65cMfOZVI6EvuOYdz+307IX2z9+tJBjxG6QfvYQtkhl0OWaL
         H0aQ6QXhPDu8kXW4pJCk33we8xr68CW7ADY0xcovbf6K6jcER0gu+xeuc6IZXAczQoqQ
         ItXiIpnSWCp19A1mpBlZ9nzzc9IHyHDUlDUOw96FWPonce68h4mJu2O7TIMqWjVlAhxE
         mu+gwOTbgbdGm/OSHENS3klVr41M1T5I+sPvJqo9+byBchFXoGWqvSu3Hw4CbqvdIgwE
         1tHEA4wZqWPQeRyvVsGwsm31mNz/hZVZYxiionflAFgnler14bTCe7aQ0r9mzwbHzg8l
         vCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795387514; x=1795992314;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HHNnwunxwLQLJ/oTo4GJ8Drx0pX6nCVu1uIdTwZx1a4=;
        b=SAIsIfCTcPs5ftj/8mPQpTZ51WI/VscfVLm9pcTh6JF9oCOqtWru6eolZoqkrLXJC4
         vAvjYxTwY73ghyJ0Wh5yANo7ZGxqnkyOiRBGp7ftmlapWO0frfNwRdz5ctXkOf7lK1Fa
         EBcCfyXiO4mY0ACMB0dDSD4akcNwX8it0TJKUy0PKPhGB7ja8rDTBvpFIJ3gyuIPzVE/
         wZ3/ZpQBfhx2iAWMK3jG19Il+uRWahnOkxp9pYLPzAq8ZRw0G0z7CVyrCBp7qJbcKSvs
         L+4R+7vL/GO9RILaN8W0dBTkZpUYp3mLKevUEyTMpOFJLj39cf46xtwq+RZ6iR9yZ0/Y
         u1og==
X-Forwarded-Encrypted: i=1; AL+hErEej0JZHnhN0O2zxhfr8DyLvbJLSTKHrNSrbwGGgzM394KuhlYxNc78idGfgjtv8O8/hLoCXfzQ7NKe0uU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VrbPmBj+3/yRA1CHikA1keNFOYR0OsX8NmUg9E98F5bT5LILU
	mJFIkzacfi/9c4JFKJTh36luMhirjoxWDhgW0d2J0Q+I+hDIUGDEdD1Q
X-Gm-Gg: AZFdTZfThv6m4Jsc/H3dc8Up5t7EkJOeB4ZM9cLg0NVDdh2ID4GGtMv+/f9q7kdrsAs
	1agNQvXNoTjTaJz+XZj7Ewal00SUqVjrHszC3qSLwTweINQF6EGMgDZKYq5gE1GVDaNVJrQl5LI
	CSFtZjY9vunoI/h1+A/tl2OaE40K3RZd68aZDa3mgrmXTIsV9q28G3PTirDv+yJTrY095nigkUT
	wqOolIKM7NgSW30Xy1VPH9nzn7ol78BIBN4wVZxBIaJZe23b8/EYjllAMWy4AJ08rXDjOxgF/vS
	7Og06VQsQLC5RlgQu9DTlRgyV3IBK+VwuEu7QrsRdG6BTx8FdNFe/xqBXq2XW1W2AkDCQX27rZi
	xqdXEoPSd8hcaVRZ7XYmKccYRG8TNGrwhOM5EFDnyuH0rZB9WPJ7F+QCt7xpG0V39w7fv7KqSpL
	+CbOEIdZ2TvOuTDTtEm9vcJ8HsE6SLe8+PKceuIL3nhsknEGvu5kvrdKbcPt7EfsCqYnzKrbcVn
	lSKPCUuHwRaU0BX2g/JQiOzl5dB8EKgbBeyHPE00bvY5ZSoAqrSuJi0TaMuto/EuJiW2RbzderI
	5UaMg4GLE3v73Wa+XQzoWxKFmE96ob0HApEDiCDw9hiol64YV98Qfx2cLmkI9eM4di8lmg==
X-Received: by 2002:a05:7301:dd94:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-3856f559cfemr9838744eec.30.1795387514423;
        Sun, 22 Nov 2026 14:45:14 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:f002:4621:aeeb:e0e7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm27669066eec.16.2026.11.22.14.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 14:45:13 -0800 (PST)
Date: Sun, 22 Nov 2026 14:45:12 -0800
Message-ID: <aa59c5114350a037e57af5cf2f0b0559@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ping Cheng <pinglinux@gmail.com>
Cc: Jason Gerecke <killertofu@gmail.com>,
	linux-input@vger.kernel.org,
	Ping Cheng <ping.cheng@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	Peter Hutterer <peter.hutterer@who-t.net>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] Input: wacom_w8001 - assign distinct phys paths to pen and touch devices
In-Reply-To: <CAF8JNhJjjCqxiZDH4mDEuTL+FP+Ugw6aM8RfhM_p9+zfNuphiA@mail.gmail.com>
References: <20261009190746.803607-1-dmitry.torokhov@gmail.com> <20261009190746.803607-2-dmitry.torokhov@gmail.com> <CANRwn3RUdGyEOJEdN1xUjEHwnBX5-UnpZZ+ZBBwY9RBB04FtUQ@mail.gmail.com> <as7D7idd-843CJkn@google.com> <CAF8JNhJjjCqxiZDH4mDEuTL+FP+Ugw6aM8RfhM_p9+zfNuphiA@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Ping,

On Thu, Nov 19, 2026 at 01:59:50PM -0700, Ping Cheng wrote:
...
> Did you merge this set? I don't see it in the upstream repo.

Yes, I applied the series to my "next" branch (and it is in linux-next),
queued for v7.5.

Thanks.

-- 
Dmitry

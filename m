Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795484253;
	b=K6iqXKOcm+02GtKyDolxcajRiZwd/vS5chrpMqAGgTYA4cukUfcwE6lCIT6V7NqWoS5Z
	 75sh0UcllLtkNES0hKnA8YIrGYUBXz5fYxVs1Lt1I+HOz87PuGoibFo3YuSkeEDjuuYSM
	 31adVzACwPuTYAwUI3HT8HNCBoMNOzMGWsfyf1zgFFhk5PzTTEFwvo21MP0OTU+ipTR7n
	 fsDrOds+Ohp9L+sM0A6ChvakGvdYIaTR9ofXc98JPp1xarRZBdf9jf4kjEDeqJemVNnC0
	 E3U1DQTsIulfk9xkhXzQeUyh5BnzI4bgBPAr/Sp/Is7JvTF+Fprr9XUuneLGUegrgzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795484253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+4GuLZnncWSPgY9po7iJToNx53KFsiruJ7YElhg33E8=;
	b=l4WBKagr6yQIdnlztEDKyhFHWWsgzbCcjkXatdrUkMbwXlwixh/RE4ms80fCcD5yOBZt
	 6PgEKxDHpEeKzdgX+LytXWMIB7/shdlk48tXfJojeZm8GJSZogy0rPmc6i1rLZKYzd7a3
	 oI/5v6dGxqRuq8pHjLqXnaPDILm/THxcHc9tybkmIz3QiXtjyo62J6DiSkFeSQyXxpKaE
	 rJS7ClWfv88L79nML8RgkXlbm79ojNoggGC3irmTMQ5rFCHKb/9DIMrA3KAGG+5Le9XDK
	 yUCLZnbmAk6IONG3DhoTbNxAX/tvYmCwcESxZoY+z/+FN6N07nuYzTPDRKE9BlFYWKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cimI2Fg0;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29310606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29310606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cimI2Fg0
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-38699cf08dfso4156329eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795484252; x=1796089052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+4GuLZnncWSPgY9po7iJToNx53KFsiruJ7YElhg33E8=;
        b=cimI2Fg0Nir9Ip5ELkjvEp3lJWUKanxHQHo6mRlDdF9wlRTzHWIDNjQbth101BjTTf
         OxBPdIsxXMaGy85nxdHqif2oLrjgyOY3Ux+ekWhX+/pUyyulMtreGKZTcyltAJxammzA
         zXl6SKNx7yy+/doSz+RMCEiX5tTgRSdA5aQ2hd9cBHMCsnXw/fWHbxWqqMjvxLMmK1VW
         SblNzBd21LlkC42g7TK1rVzpW4QmJmniuMWOHQvDyaAfh02sZGrhfS5FP9m6Ab7zr3mo
         XdJG8q0GqNB33VnviO5+34swSf353B5TcgS3lax7eCt+/Dy0SDcLUYGLJtEn8mU0xVm7
         Q9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795484252; x=1796089052;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4GuLZnncWSPgY9po7iJToNx53KFsiruJ7YElhg33E8=;
        b=0oTz3gdlnbgZ2vRpU9wpNkDYtuxuqqHxsWG8V30NiUXMoEybVRLJX/yrRb8NzTfEQt
         rRocHiXUZ0nic9f53C/7Uqoo3i3XanxCJWLVdQb+dNQJAbjv7AIeSoa7sM8suflnDe2g
         hkfsjcVbhlpyrN0t9vJdZlVHOL1nL501AGXtiYXFpQrd3EHbjNp0+YsdMWZNR6doe0v2
         rY82G2SFDk56ftcWZBV1jpKH9V3tMIH7BeFoDaHvU9YEIU5e02HfW/cduBEJzqMjSp9W
         7XxepXlf26u8SX595C1eVXcgG4NCKMTCLu43Ypv9Dv8Bt7R4uEWPQNjip/RuYwrZ+ShT
         8u6Q==
X-Forwarded-Encrypted: i=1; AL+hErGGQzISPKXwFfK2je6PBD5V1ekiO6gHYX2dkXqgiJxjWI7ZDsKxQFuR+uHA7e4VzGM5lKpMQbA7lOJMnnY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+LokQFw/Cuo7phssIFn97kAnp9zwDUPwzAmdnTfekWgnoytqi
	XQ4lOQzClOBJRaCiwq7aPIMeURpkMkMogL1pXOJ6E1i77oFuxVZJazO1
X-Gm-Gg: AZFdTZd3t7A5m6zkWnFuNKrkJLLew94inpmP65tFw0dlr0szHrDnr+4fUuCodFrigfh
	8tuyWSxu5XQqYboWdOgPWCyXx5ebqw4QhPGhFD7MHx5QEBPx7D80dnt6iatO6SfkEMxtyFIfo+L
	FmVHssXfbiWhMMKTpSke53siKQ8S5evN5O3ctzeMhNc1c3Nls1E0cLzhjaWiOl4uZd15S86r7+x
	oy0aGQtypfAslkXwkl+x5W84U+KuFjsTQhi5pDMaYJbxAMwJzJn1RG+5k1uilIpmmeUq0yrfTTI
	H50+bjog1wIQ5VU3kisj1SDZhf3Y8Gq9BVOzKJX6qmR6ZvVLjuajyXFej4lZrnWHNfVXlutIu3P
	nWuW9zRGQYNQh33nDjPvZuSmQ+BrTY1ZmpMi7LMEOcMv7A543iFz13yF6j5g2DEfKUkm7CYD/0z
	Upij3e7F6hTqQBpxGHbunj/KgAKhwF0aOv76YaTF9qZh2O07CSN65+J+BjlSzeBA2gRp3GsdkDV
	yu7jztxhvF7BvfCkCi1RaXt3XM6awlQQpalvVrHe1wUb1sUPqy5Vg8T9Z7oNvMMwjKPYM4BKW0o
	zibMiErLdU2aT3IhU7Yq62ZSMJDATm5zdhlhfJLxGlUssYjTGTVidUb279wIhxxfHsRMfyQ=
X-Received: by 2002:a05:7300:7c08:b0:384:3123:a0cb with SMTP id 5a478bee46e88-3856ff5b880mr21376997eec.27.1795484252142;
        Mon, 23 Nov 2026 17:37:32 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm33334473eec.25.2026.11.23.17.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:37:31 -0800 (PST)
Date: Mon, 23 Nov 2026 17:37:28 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Chris Sutherland <csutherland.random@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: atkbd - skip deactivate for Lenovo IdeaPad Slim 3
 17IWC11
Message-ID: <awTqUmpSO79drKco@google.com>
References: <20261029164444.400649-1-csutherland.random@gmail.com>
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
In-Reply-To: <20261029164444.400649-1-csutherland.random@gmail.com>

On Thu, Oct 29, 2026 at 04:44:44PM +0000, Chris Sutherland wrote:
> The IdeaPad Slim 3 17IWC11 (83VS) creates an AT keyboard device but
> produces no events after atkbd init. The 15IWC11 (83RR) already skips
> deactivate for this EC failure. Add 83VS to that quirk.
> 
> Tested on a 7.3.0+ build. Without the quirk the device is silent.
> With it, /dev/input/event3 produces events from the internal keyboard.
> 
> Signed-off-by: Chris Sutherland <csutherland.random@gmail.com>

Applied, thank you.

-- 
Dmitry

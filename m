Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007164;
	b=US23cBnA8pr6tTsDuqs+dVV9cLwo3oXaR+v1LqyE9VD7C3XO6MP2tzDDkIDKf4ofBOPC
	 Ne5nU0sgEXzDC/oQzhMinAW7bWtXRo0vA+mJST8UOJesT6B2ADduENapAC/9XU3dqCay+
	 O3hU/nD+b0lHCeYL50ld1JyFnYbds1EgsuwHZ6oRspOm4Ar9HNexYF3FInfYQ3nuuy6hO
	 BFL0N2NXjDiYZ9JG869u/fylofanBSDgqtksyD0hmwbVBGyOm2mcLe0f8McPGc5mg22ih
	 6GAQ20+c8IYur2DRD6xoyudNrVx8FroEwLyT3PIDTLydls6GrT7jsdWfCcRfEo6qx8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=tP8QKRJpZigGHJKGRqvFEzv+St6vv1COCqEtNwoaz7I=;
	b=vHLmD21X3s9Aa0/vxIoCOvTjG7fiyVvHMSLemBhPt91qOsas9CqrdruE1qZf/NYHnq4X
	 CjbKfrD7+Ncgfaiqo3zor1ZIH4EOi9jJtP/ULiMtpEAihALXITu9KlbROF0p9iPM+QjyA
	 Z+6NXrIaZ6bX1qOx7SGBHEDaqKVn90Dpf+sZNRsKVmHfaYKt0WBDAj+zk3RodeTD2QK/g
	 n/+iaKNWJWRziWpg15nhmlwz31lhSnF8s+F9AMKR/UyEA9QK1bdtM1ZgtHDyN+MKzF84c
	 9RGg15GtdGcLJgdhJ/bgl9eyPxCl+AFD1L2V+Xqeh8/CjDKHcZFrA5VFTAPahfX0Bng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BWR73Gp8;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5737F606A332
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5737F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BWR73Gp8
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so7625695e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795007162; x=1795611962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tP8QKRJpZigGHJKGRqvFEzv+St6vv1COCqEtNwoaz7I=;
        b=BWR73Gp8ur1TqAXGpsO4UaQ9kojgP0l25Y9EsOwJN9jJ29SmPg+0OkAG4NDidExD/4
         Hr1v5u5i25ZD9WY0qFfn7FzJe/uDztuJnPpwRtc/Q+nsXf9pcfOEdDXZSne+QoQJJMfN
         q+E0URIEcdy/rBlRwVSWZ7R6IOx7WYyULuZYfHBxrolLmPPPrlNF8fZ3GP5q3amWfH+s
         DIOD/Cb8vK70lK3NnN+qEVPVJ+NsCd8cFWRYolIdGwP/CyqXmLO99a7S+zjjJqLVtl1N
         v0HxxanTuFQx0iElx2nuj1YSc/O7m7zBy1cKYmElYBwKWIh0OgiSiuPjowps6/nW6c9Q
         32PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795007162; x=1795611962;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tP8QKRJpZigGHJKGRqvFEzv+St6vv1COCqEtNwoaz7I=;
        b=cpRNhmsiy8JniFJcpiGN9zuhS/fNdVYXhCk3bU/g/PIFKqadSsKW9NGt5Y9EcYAXUx
         DBW+fBPjuk9Ko3A1JCTpNvFeCxChV93/3JksjS2VM5PQUbcRyJqCnsPd23vywuh002md
         WCM8MXgO5u1wc8e8hMOJn8OL18Etva6doN0PMkkyLlLIcm2xnLAB+JY64NibYKSmPO9r
         3+ISTspfF/ktrMslwJ0qTrFoKI3im6LZY74+3q2A2MoSKilmdXY/OTNi46BJePxa80lt
         C0o6t2wPQf2ZUnoZcj79akAWi14q+TRC3hi2P5Qmkft/lsZKGOHN5CaI9QeIZkvqw/hs
         vpJg==
X-Forwarded-Encrypted: i=1; AL+hErETTM1okTGL0AJ3cwKnFGncP8W4O6ScX6sd6FZKgQteHzkyL7wOg9ULVNXUJwMxjVLTb3XH6wn39gsDiZU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JOCfD8RC5IM5r6GFcssf5XQQ7ft4gnMA9p3LF9sKmX/D8vkIL
	lIwmyqszzC1cW9TB/ERexQseXjvmWRCdg7Nghh6fwiPsyrwCX1Xei6cY
X-Gm-Gg: AYBFou3CJke086PWnFAi1PmQ5meE5ZEjBJJCHtnjNzocpsimdo+z0JjQ0/UL6/hdbz6
	hbe9frF8A+LsWJ8ViWawr8spjY31w+Rdn/vSvVGgBuRJRZwvoHVT6ygV1o9Qk3v5CcS5JvMI+oD
	8sZhpMd6wJaPVBhI9rGyUsPgRqjihevEG8LZEn5Qd0YPyeGXpX5adWFFz967SIuJh0rpZ8qibNN
	TIxAMz35qmOUqPkz5BXxQ2FWrpjyiMnB7Vca3kxqGKfz+Q3mJoro6iwsm0FJykM/HXOr7Jti8v6
	rNhKFbx20EPd7ypDMXztr3bNjE8BjsX/2+NEfKnnEEUYz3ChNKXZABRRodLyWPwM3BVRZVmYwVQ
	d7/qtZZym3gu5FCiOPCUlA3iDbWWWIs5Xq3e7rTyJKxBgbORPq4Xd2HBiIWavhXWubMSoMy3S8K
	RxrNuA6QhyTGZtfn7jsooZBTmLx/mHRTKpV1U4Kiv5Hm3iP4UPIXDaItSyhtJLYVL2J/Vg4KEtJ
	qNKiM5dAVp3VqcZcGTjRfrn5zDhPhPWB0JHQx2qxalxG2aAXoIJWV02PFu5TjwfdfUKIq3Nl8+n
	9f/qHkKiWJjMAvs3/WmERq1xi2M0ogwbv6hCHzNyrZS+9naadFuQkUxHibwdu+BFJiOruWhD2nf
	w68hmEm6iTe4W2TfaVgiJmwVl+c7HRxhqpNzyn7tlDYmmzT6+jkX1
X-Received: by 2002:a05:600c:3556:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4bb7da26d70mr47037875e9.27.1795007161548;
        Wed, 18 Nov 2026 05:06:01 -0800 (PST)
Received: from DESKTOP-IR7J1S9.localdomain ([41.111.247.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2c3c93sm95218535e9.13.2026.11.18.05.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:06:01 -0800 (PST)
From: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Tyler Hicks <code@tyhicks.com>
Cc: Jan Kara <jack@suse.cz>,
	ecryptfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: ecryptfs: the lower filesystem gets modified while it is frozen
Date: Wed, 18 Nov 2026 14:05:56 +0100
Message-ID: <20261118130557.374-1-drifabdelmalekmohamedsaid@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261114-kranich-banknoten-anheuern-5d0a2354a51d@brauner>
References: <20261114-kranich-banknoten-anheuern-5d0a2354a51d@brauner>
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

Hello everyone, I’d like to take this one unless one of you is already working
on it.
Cordially,

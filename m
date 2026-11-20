Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135504;
	b=kfOsWVEuCLaG+jA2qpWPT1tJdGV24cK8I9i9vpTyxdPNCWcqfZEAHWbvof6HsriKLHhw
	 En0UrnwAuvsfwdgh70QnDE6JMkiaTmRZWORomCEurv9EN5Km48cS55SElmEma0mJmQnM0
	 isdHcAFlpoFhfh7QmskdSrgfWNh0xRcf0Sis2P9o0KtQ+gmjw0A/V0V10LNHAYaZmh9sW
	 7Pwx7tdLtchoN1PigsO61a+GKRn31RqXBx3HM9H9P36UtqTI17MVa751T2wRUWQBsREkw
	 Rm/5LhtobnmLNLSac/L4F65atYgrW5IAWbqpSxXgWDeLflDHbFmyXlcVqcfsLA4Y1Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1Lg9ws/j/6auwX9L1aWdcPJ9TeP6aM0aF+U4wWzZcmY=;
	b=43omg6Zcd6hgeeVPEdnpbnxhq5WlXDo0rlX6lt9g04R0y7tKdj8ENfiQhfy9VjTK38D/
	 /eOzfor+kMPRcIc5FkSFdd85+jp/ufBMuIRnotCCbPCD8mrvVF7LfjVeY5BWxun0Yq2F0
	 34A1MPkvTeHOoPbX6WINf+xECLlb0t9Uo0XP3BgiBv8+qv1cxhXXKY9JJnzoN8En6uZ8d
	 dI9/p2lqiyusd5a/GFj0T1/C88IqOYkjNZ9t/nLOu3cdYXzVT6ZV0y+Plj1A8AHJlQl9u
	 2kdtU6mer8jVUHYRnwF0bzLqz0tRqmwxY+usBtTcRZPleOuSgoAER4ISahlS4YGEw7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qS03fiE5;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CB760A2605
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35CB760A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qS03fiE5
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4aa5833c263so227730f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795135503; x=1795740303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Lg9ws/j/6auwX9L1aWdcPJ9TeP6aM0aF+U4wWzZcmY=;
        b=qS03fiE5VkZqWNA1/yxpm91vGHIZJ+DOi/JE/3wB4sN4v1mg+HipK16bveShnc2y4s
         ML+nATfo+Qur5Ht2C4SECHFfAhGBmC9lUmWR6FY4rIo9W+iQJqS6FV993SRUmSSIAzp1
         pWtiI2F0N056+fe79cw7ECpLjVy4qhH1+3jirPGZwSyBAJL5m+btCynOWAYQWydJrVbv
         oeYyucmoZJzccUzT7ZwH5DK6ON4rcRY5eUOpf7UE9MiWWEKKnzNgg27/3YVtXqrM7cKB
         BK2Z1627WzdNs5K4dfaUQ42nrk4g+FpOl3wsu2KRpG6fANJO/Ra2zf81Z0tp5d2Ax+GT
         ECcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795135503; x=1795740303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Lg9ws/j/6auwX9L1aWdcPJ9TeP6aM0aF+U4wWzZcmY=;
        b=2POb5COSdkdrMna7ySYcS75ZdfYHqYPbCUIERQyoHcIB5/nePDrKQYa/Lu8RUmPH/j
         0zBzHgphhhO3wjwlb75df//PhlHA7a0wXdWLZNd0GqS3kpeN3AZ2DUZ71hNH5KQsPV+k
         oU6aIuU+HbcibTjUVKgx8a1r6ACBsY0IHqf4KaPDajWoE/KTq+LYsob9XhZXFX0vfrkp
         65EWyLaCZhtG2W2DLHFf4aVS2pYEgb2nuo+YMz14T2s9VfF4CGUxpt/sBX7KFu0h5MVl
         eMkG1grcJ28uNwabmbCEnl2Vioz5e6LS6QP6DibWjGZk2TQtGrnN4bX5hLDzhEGJtrW5
         N7Ng==
X-Forwarded-Encrypted: i=1; AL+hErH6qtL0zc0E6XrnW9biDg1tz4g4bWkgbjV956Nnrv1FYUOipZM1LlRkgn9qCRoClLzqQrZM1lxsDgQVYZg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WgJU6l+5n2/0X8u7awOU6F/NAE+no2ms4+ghRw2Gahil/t42i
	R5d+EE5dFvjGInBCRMCfcN9HuC/3oTVqXw/20AYLDKT31t8jobBVXZc3
X-Gm-Gg: AZFdTZcKLSLG4fDr3SRBU91necdezXnPJhiCoqHJu1vPE/0rzb7kzNQ3AsDQfNJ8CU8
	o4K5SbHz6XAwLv3ZPLCpkiY3y+n/kyp2fQdoWjARnd1aDg1rCDOSb6fkv98vaRfxIEh3qEGYZgU
	toL776ZIUs6ZDrwX2YX8ckffhHZ802QYGy6DDFd+ErlgKbsbZCRKWaLp2vlthlk032pG+0lIy0P
	ANqHzjky7+ZBoFSo5SS6IkOvvYWYgPqj8Zk05/4zUxxohKyb3YFZLifyQo/G0l/6xy9MRxqKeFP
	KA8yWRXRMvRTvhaNUjiOPz7Wpd+DBw/7wfns+b0qAQreNOheyuoo8tyAMQ9jHQa3Uvdps+c52Q0
	W5MGZR7HdMxLGRzrtevKf/lEQN2cPxL+Jerpt/wAEW1eVUzpJkguKK3zXCYrWm5YSL/tZ0xuBVL
	At5vD7Rp8dTgiMVqFQ1vlfwaCqDnNev10klWZDGXhZomGeObbPpyhnBCpflIUATg1ygwJqUUfnz
	o3s8y/xC/nGkjLl64y4IB/ZWSgsQYBby93T4XcyS9QXBiPp1X4y++6w7+E4DQocWpCBfVIyeMbH
	vOhixuXBt1s3ZadnI61aigmV9hUjOhm8fHiRqg==
X-Received: by 2002:a05:6000:4a15:b0:49f:eb4b:faa3 with SMTP id ffacd0b85a97d-4abb2168f46mr2035428f8f.9.1795135502648;
        Thu, 19 Nov 2026 16:45:02 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:10:5673:5f22:93eb:1bb8:839c])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm2438480f8f.51.2026.11.19.16.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:45:02 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Gianluca Boiano <morf3089@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] ASoC: codecs: add TAS2557 mono smart amplifier driver
Date: Fri, 20 Nov 2026 01:44:40 +0100
Message-ID: <20261120004442.1687225-3-morf3089@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <3e194c71-2902-462a-ac77-e55f30f3820b@web.de>
References: <3e194c71-2902-462a-ac77-e55f30f3820b@web.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Jul 18, 2026 at 05:36:34PM +0200, Markus Elfring wrote:
> Under which circumstances would you become interested to apply a statement
> like "guard(mutex)(&tas2557->dev_lock);"?

tas2557_dev_read() and dev_lock are gone in v4; register access goes
through tas2781-comlib under tas_priv->codec_lock. v4 uses
guard(mutex) where the lock covers the whole function.

Gianluca

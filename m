Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173659;
	b=Fm/i7HeZ57viXUcyr/IzmoK+HiU7dKdZScdLaLEoykV+ifq+nTvzQ9XCtEwDAG90AqET
	 AImxxJs8NN3aXY334U7U6Gye0GxZgAPo8sBDJWhEOW+R/XVlsr2NDKF7TKDvhRmxmdrsM
	 i//9plwP5HG0XvZObAmvtM6swO/NQdFs5301WxGkc6BQK8Sit5HPCxQOklTRVQldMb4pK
	 9Ul+8KGF38vGfTM4XGsxdh3FMfw3PQHagf9K0X2vgUc0YgagR1EaEp0961aGm4dLhHOLd
	 zuayENIOa0QV0dJaKPOHjUp5EJMzrzdmJJzZUJWM+2RQ+zXzhxBuOqCcGmnuCugJ06g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173659;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t3IK+6RZWNtPak6+wEGWEUH2Q0VnpjhDdVRL8yHWQZQ=;
	b=Kd+KsCnEY7X3IvCsRf1cfkTi5A78V8lYETDS2gxsTkOA0cBdoW/Ob3bq6ujjV/EjBVhE
	 yZmWH436aTrziuEeeIlmvXPy2rF9Y604/Nxhm6PRuRd5rNYl3yH+tH+jDF4EaUUD/8MaB
	 MiSePtzXWN6uF6rEWePsq3CtRaI/ju1XzyjV441CxG9nsgD3JYW3AwxPaWwI0jwwcAfAd
	 RK4tCu6P0KsMmCzu8i9f0K2YwFzkjQ0xXls9P7SgFUSAVYrQHH5c/DPQt+mlWrJkNajEI
	 yTHxv8pQcLUJnEaqXaaJ6xuzxUSE50QTfKchzOrToOuASFwakv4eRSCLB5KWfCFsP9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b="T9fn/AeZ";
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A86606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34A86606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=T9fn/AeZ
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A678F3F97D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795173656;
	bh=t3IK+6RZWNtPak6+wEGWEUH2Q0VnpjhDdVRL8yHWQZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=T9fn/AeZtTue6NcjDE7lHbAtWL5yyP6flbvBTqTK/SbUyHmn5x4YEkIsdeS0wIA6G
	 lom9eaOUPfwj8hU4w0KLXwBX2+t4aAgqboOKn3af9RJUsG0YsGrVbYN/9A3vIA8bOe
	 LD1+/ULYNbvVE3Wi8af6M24AdG4b919tYiF5B5uP73doHW/Qdmy/3mp78MVJiZ2dLb
	 Qsj9Ws8dUod3rb8/4OXFedhQhwm8Kh3GLEbxHzc0mJHIISUUKkkpUsfHVgptMy3Z+r
	 cwJOfnp417ueFyeUE25hQMVMReOerwuuIqv2Ec6Sfsj8tybhc3ElIXiYC9fxnePhcB
	 UMlrUrVp8gQxS7b/nYexZDCRiLCzzJ43/wiyWayV4V4MPgbwHEbGPbC3kgf7MSKfG4
	 RYenR9GbWS/hqEFWWXdCSCMp5czw5Su6lBoJxOVB/n/b7MRB5jpz9pvTGxeEyLjjr1
	 JXqcDgpejO6xLU1qr/dUdsCh0D3tpQHg5QAjLpylLMUIHki+l/D5BGK0tgLmrOlmlX
	 CCo80dsZNJr+Upxk7ur3bGz2elxYc3/SKH3HcvU6bzMXhthWnU4tRbD20JPrYV2HkK
	 5VFJnPjWdpAX7bIpVyJToWy+votpdqirKWZ9OaMjHKI1jDxXLBlav+4aJkirSWJEcq
	 ozYv86hlrO6IyNk0/XdXuY44=
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b40e7f4fa2so1562575a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:20:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173655; x=1795778455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t3IK+6RZWNtPak6+wEGWEUH2Q0VnpjhDdVRL8yHWQZQ=;
        b=z9nKFC3Q4kpWxeOZvMR7jQUJYCO56+AlBEiANc2VCfbm+GrNLdRFjaZZz2+3vASo/r
         E3iK9WFBVme7qGitFTynwUDzM8gdbGVYZLYU9lG2PMmBqE1Gz0HPWFEVky22cw/5b7ig
         ZiB70zBwQupCsdiqF73HECbaY2HnyrqrWpPz9LZJgczvZ0xJ5BkrL8DVIgXLB26wmZ2Q
         O+BLwJp3Wf8EE6oc5OYxvbdq99t98YGzAbTEaZlEpM8t99+QyO7m4afBQFXmTFW7WyEW
         2lG4Ut2b3kyznlTm5KVtv3jw5i7vgK7zmL2zy3fl4dqSF/UdN6/7aulfmkH7GjrQpi+3
         ll7w==
X-Forwarded-Encrypted: i=1; AL+hErFVhRA1ZtjpJnzAm5oMZYTx4djEo0BaEVGDgmkLq0hRw1p1q+czKXqOCwJ7j3vcFJIHbYcT7KJsb8IXEM8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YX8s4QAg5IO6601U9+iRvLvpFO40yw4gyQMiJLqbJb55JfqNI
	63xMXieQslGDvfF5fwzXnDRuGUQUwNPizBPH+Sw3FnvJTQxHWHBjqqPQMOpPVbkrrmn6aRcKx1O
	KKOn2O3CgoBZ5fpEZwyCrUBBJV7ege6oTi69J0ImsZkVm0A+sYf7jWh7jqhnEsWqk0L6uPA/TuK
	gALDZHTA==
X-Gm-Gg: AZFdTZcebksL+GO/rJHGP/q6y/6x1AIrOVn7wcacFOdHuZDDNySJsjqWmO5cS/Ekxpw
	ZPUr+5wSVW9d23dJkE9ruQY93DJSLcVkTpBuRJi+4T7wRelQaXMzZqwIkHONEODutZpPCjox/w6
	Ua3Xv8cFCa53stHUAX9qdjLhcBzYIpIa7E5bWLIdqyj5lthiOYCv3jDMCQtfNoczwIxfUY6IMmF
	2l+jRlaLcqHCFkUnPuyi434icw7sL0vH2ckUWTPzl6EI/focPBEQYlDyd06UcY5GhQCddojE2Ik
	ih0/RydaHNo3Xf5cmhWa6wt1VU3cp3TOr6FvOpUfj19i9VsRzNaQrkVFKxFE5sU8kdRxGOfQoxC
	+vEJM6eqipWs+n1IN8tvS4wUk+tXYtLGtUSLhNHubP+fHO3I2x2QZWkykJsc=
X-Received: by 2002:a17:90b:4d10:b0:3b3:c4dd:5437 with SMTP id 98e67ed59e1d1-3b41c852d1dmr2916566a91.5.1795173655160;
        Fri, 20 Nov 2026 03:20:55 -0800 (PST)
X-Received: by 2002:a17:90b:4d10:b0:3b3:c4dd:5437 with SMTP id 98e67ed59e1d1-3b41c852d1dmr2916533a91.5.1795173654661;
        Fri, 20 Nov 2026 03:20:54 -0800 (PST)
Received: from ZBook.gateway ([123.208.39.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40285cf3fsm3994767a91.4.2026.11.20.03.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:20:54 -0800 (PST)
From: Changwei Zou <changwei.zou@canonical.com>
To: herbert@gondor.apana.org.au
Cc: changwei.zou@canonical.com,
	davem@davemloft.net,
	gaurav.jain@nxp.com,
	horia.geanta@nxp.com,
	iuliana.prodan@nxp.com,
	jeffbarnes@linux.microsoft.com,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lukas@wunner.de,
	martin.kepplinger-novakovic@ginzinger.com,
	pankaj.gupta@nxp.com,
	sahil.malhotra@nxp.com,
	sahil.malhotra@oss.nxp.com,
	stephane.debusne@cynove.com
Subject: [PATCH v6 0/2] crypto: caam - Fix RSA error-path unmap and unaligned dst buffers
Date: Fri, 20 Nov 2026 22:20:44 +1100
Message-ID: <20261120112044.1174236-1-changwei.zou@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <awAS_kKAVkL2uWKT@gondor.apana.org.au>
References: <awAS_kKAVkL2uWKT@gondor.apana.org.au>
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

Hi Herbert,

Thank you very much for your reviews across these versions, and for
pointing out the apply failure. v6 no longer applied after the upstream
caam_rsa_set_priv_key_form() changes (a91d9346a70b, 828c3b265b6d).

I have rebased the series onto the current tree and resubmitted as v7:

https://lore.kernel.org/linux-crypto/20261120110525.1170175-1-changwei.zou@canonical.com/

It is a rebase-only respin (no code changes); it also drops the
non-standard "Assisted-by:" trailer and carries Sahil Malhotra's
Reviewed-by on both patches.

Kind regards,
Changwei


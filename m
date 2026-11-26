Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.203
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795716534;
	b=IOOFDdC8ryHialLpwaVuLamL8AsvflNqGCnh/5iUKlWv4KqaEw225extsNUBxYemhlAB
	 EyTevONN5pl/q9NcA/DOp19BsNUarzG2ZElN7P0KW3kqgOt9TDbQwqrwjOJCR3nlFxSIt
	 oS4NSpS6aZTinwTefCNOScaQsV4hkHTASDNO+5b4jKvEz5nftncIeHZbUmILfADsdlIT5
	 Itsc94NZbMLOkn+0bsCjO1gy+ZzjUXlJSLNgsc2IRLCTLp77S0e+bjyZ5QsQxmQcOtX1P
	 gJL5cQzZVP+JWu6V8sGBqycaRtxeRq+y0g9o5v4Rv8HV5mWa+xM8kt/rQeAJyZKaXTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=GPDH5iymDD1XKiojTuDMjg7ZZbxBabRJM2yU5TRq6AU=;
	b=s2d7P25HzVUcnC5GpvrrSPMu31EtKgq3KPq36rlj3h3cspHQdmfSCCyn76JZgX/KWmjS
	 Oklv7qVI8D6dzel0rlYzfVCA050Zh5lFHhcSejfcliXp0JnxQ+6LctBfwn9hdmhZu6rUZ
	 J9xfgYkE7+XxlMOFq4Wb/pTSzzzwiIekcXo8GW0qSRlGKO5NdZd8PzadvZ4nihFWkyOoA
	 Cd4dri4usONR2xuWXzD2BS3COScaALLSYQkVfJLJpTTXX2gQrGFOCiL8N8PU7FDigROf8
	 dhGNBnPxlW/tmhZjL68frEz0pOU1H80I/cxwYXfQZyI9AOl5JveRggEkeiRgH36WMtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M5y2t0eW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.203
Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D95606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79D95606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M5y2t0eW
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-568042aaf90so1040494b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:08:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795716533; cv=none;
        d=google.com; s=arc-20260327;
        b=ZMdQR6CVcDtix8SZuPEs0eqthmDhEy50ORT91Tb5LYyfpzbw13tdVb5D7WJHZCoMbw
         Mz7HpSsFE97NTyj3TBNrITwXTqyBQW2UUXtjMQuXteH1eIZvD6f2lytwVDGANRuhZ/JE
         gWuOyWspb0+SzXt+e12BfcSHoH3EO6K6VnTwz9KYkQ5NUFxMY1byNvX95qVlB7CTeUcx
         qlBbQveGhkiK0GAhsgeZgh4W2wHYIuPRVCUrxljyuQyYvPt642WtO8AS1aHZMSgD/2tW
         iC1H+xfa6fC9Kg6Drz0K1vAa4y2IvU1S1n2jmVnT4mi1+Nb+OPSCMcTlMNeLBWD3ioxX
         0ROA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GPDH5iymDD1XKiojTuDMjg7ZZbxBabRJM2yU5TRq6AU=;
        fh=eFRz7D6cR/a7eod2dvAfU0tVezDUKZJSufcxE6/gSFY=;
        b=qkzdlciYaGB5qMrthA4P+pZwJldyg0DWa9KZSKtUukWy0LNx//nuJrDiz3KBYW8ZJy
         JiqHR3nZfOBO492BCaeYwFdXeGfoPyoin+VyiIuzyJQvXoWKzqeQlqybWYavJLfokQl3
         q29vc9EuAtzeKjZcCOkAq8X9K2QKSvLIVdGyGfQoqJtt2TGqKtRg5qFDCH/Gct+tx7Wr
         niJQciDzmq45oSj1X5otSg3S4VTjj0Su1yZJTrJmfDvDGSgZiL9K+dZupozJSLo7vd93
         s+WNZLqPIOfiz1xBUJ9/k4obCroNvbr0L0ik2umWWQMnSNCCulWAUpAIX+oEovx+cwP+
         UEoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716533; x=1796321333; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPDH5iymDD1XKiojTuDMjg7ZZbxBabRJM2yU5TRq6AU=;
        b=M5y2t0eW699s8skqtUYN0i50s4bbAZ/h5qrTZoU0S3m81uLm32Ezh8TD3xFGtlERN4
         Lrx8DZkcjPtPC7qYdoBmulkkS9yTt6kKgp1sx7xxUdEU4BXb+rOYD+u6leFPG2WFIGJ6
         MFlKpGiFojNKsRS/MXkZs3J7nxs4RbI59qRdJ8yMwCCt7vj3ZE8sYKQxW+CIZMAfgyCJ
         AwnvyRu5lig0WXf9/QiPpD5sgmOaIia1PTW4UIpsx6hl4beFTdQBiLvaM6aHQ3YIOLQY
         ZMKlDbNbCJ7E9K2cvPbLYmPHh4l7b7Yvl82BmQAVbuQJZJUn5wVBm1nHK7cwRWdE1NeI
         Z0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716533; x=1796321333;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GPDH5iymDD1XKiojTuDMjg7ZZbxBabRJM2yU5TRq6AU=;
        b=D95SQi54m83HrBU6oXRThgrRLwfqjx6wkwN/DgILtRPMIxvToMvWRV+RekovTRjO6v
         tj+3xJsnhrlefkrGmZtpC5QoNO6zqkRNeu8wzPcSrf22R9fahg7M7qVagwAhjssXnFs5
         1omsHQOqWqF9E6fhp3AJC0CiY63LZBRq5/uc8L1wzPd7qb/3LKEybxlR4CR0B6OhGm/J
         T1ncXopMF9UlzJjDrYJav7pBej3GnHibxuMDj+K2Dqu7/273w4xFo5zDrZ5wegQ6oKUK
         jJkbJlT5fcmxyw0gNps7uOJUR+iyG8wV2EgN1SZoOEgBqqnVKIU8iNYJ2gYbRJtMaGDs
         ldww==
X-Forwarded-Encrypted: i=1; AL+hErF+cB5WBGYUYfZBQNTl2keqrv2DAJhljJkCFdvtV7tj1ocTX0cZ3oA60p/UxRd+z978jAFSvBtX9cdaBUo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CKE8eTetlGpeczPDe/MeORs3quXj+4nN7JEAXQaT4ua3CwEfE
	kY2objl9DiZzDavAjWJ9BRHX8sozE0tKn8xz9mUUVJaPyFeL/v4Dqtgz8VE3XXkHU51OsKhmssU
	Ee5lq4pRXVr43an8nRQgkI0wxhXTCJL4=
X-Gm-Gg: AZFdTZd/PvzcYUK0V73m1QYZ61HTSq6CgO0E9QO6O4y3WgXMsyutlWhV93zCYrPl2kS
	OzPhjUpZ5L14hvL09j5rh87HZBMMz7dMFds0SOA63M0iqIcA0D8o8aiTM9f5ahfhMTf1SCezPzp
	xnm6y2kXk9PJfSNPSvNvm5uz9n+0g2K3tocxpXlokc+C2Tqzap17avnEA6ZFgkNU7iQQx1jyJLs
	n2QZYnqnhmpmabz80s4WF5PQ794X2VohRy+YQW6ZaW9yK1exdurxGSAVZyA4/K5ECjaXVkDwFD1
	E0joGsg2DCCniiBVTn4tftiPyZ8Y+APBNjbw5sqBR/sfOLBSFQZKubitT3JstgbIQocFFYi7/LX
	JMj9XfQJt9aht635cDo2ImU9AdfyKoYDSsZjc/n3yohIFRk970y5c5FZkyFEWQkOCxvEnn2b0uN
	oMkx0JlYW08fDv8ee3B9tFfHb3EMnoAL9biVU9MqpoJwTYnKp9uzHy
X-Received: by 2002:a05:6808:16a7:b0:567:c40e:c79e with SMTP id
 5614622812f47-57a0a7199a1mr21127806b6e.24.1795716533448; Thu, 26 Nov 2026
 10:08:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126045222.20770-1-dennylin0707@gmail.com> <awgPDmEbGpJsT_iS@redhat.com>
In-Reply-To: <awgPDmEbGpJsT_iS@redhat.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Thu, 26 Nov 2026 10:08:42 -0800
X-Gm-Features: Aa3M54o_0peM6H-aXQD7e8ntI65htstUEnHPSULUoro50ukRn0p_g-FggU8niJE
Message-ID: <CAGEkeHcK2rSWyQOp5a6Ub2SJ4wi8qK_Wz5uKH0WN+pLksL9jLw@mail.gmail.com>
Subject: Re: [PATCH] proc: also check the opener's capability for
 oom_score_adj and oom_adj
To: Oleg Nesterov <oleg@redhat.com>
Cc: akpm@linux-foundation.org, brauner@kernel.org, adobriyan@gmail.com, 
	jannh@google.com, jack@suse.cz, sforshee@kernel.org, me@black-desk.cn, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 26, 2026 at 11:50:54AM +0100, Oleg Nesterov wrote:
> do we really need to keep the old capable(CAP_SYS_RESOURCE) check?
>
> If a privileged opener of /proc/<pid>/oom_score_adj passes fd to
> to unprivileged writer, we probably don't care?

A write that needs CAP_SYS_RESOURCE still needs it from the writer,
even if the opener was privileged. For example, a task can open its
own oom_score_adj with CAP_SYS_RESOURCE and still have the fd after
dropping that capability and calling execve(). If we only check the
opener, it could then lower its value down to OOM_SCORE_ADJ_MIN, and
any children it creates afterward would inherit that.

I kept capable() so that a fix for stable doesn't relax anything. Or do
you think the opener check alone is enough?

Thanks,
Hungyu

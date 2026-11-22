Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795337957;
	b=ETUABN4caRPB4Du6fk23JfpopGIAsFepOn94UPbUdR0NtmgyuuoQ6mj1B+7HNQAibIV2
	 Xvi0pO0FM1SWJvtFN5i8CGMI3FpINElYeIDQpktDU0LPyfYVJH8JUuw/gyNb8fx1kO5ZH
	 5Nh7GHPRBj+rsnapZxFG3O4s1xknNncxip4wyO1T95QK0P4P6nH+kI7pcIoQWw5hlvNmj
	 4Rb9bibe+uPGPtoPrtv3Og3KPtv24opth5CLIdtTI0BpbSHm2DhYWSFZMhZCrXpPfxUHT
	 X8AA2lPWTz+Gbk+7wg04Dod0Qtnzr1LllnoCp40KImvlJPt3FI1R+4VsGBgthNCXqiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795337957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=bt+vNC5Ck7Tec+thZqwOgrn1YnZYE8U6h78l2ePZXOA=;
	b=1O6pXxreLYjN9CIDBEKz3elsE1YkY5CelCqbG+9chDLDjIlK1XfuVhY5NjmA3PBCyWxv
	 iQKqtuJAThYObMZJ6/C0ftCOPfKb5gyIEfY79HxS1ztyfciyk7j/45kqmVOKtG1V+Hqnu
	 1aOxFAiPdV1i4H7QwVsSU3pAqMjkZTpHi4btpX2fC+nXi5Z5B6pZmrA5uzJmpJd0VAPJ1
	 lbJCaq0mDawEPIBpzU86Da4lBcQRmu6/n3lk970bSYGXPOeD/LDLOgv9Oq9M1GeYq4aPK
	 ccyZDgGTcbobs5mwpVhiJs+RXoGuNnz+xajgb3v+Q0+gEselb0KFgZAo2B7iVV9O6Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="QFzXp/q7";
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7D1606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C7D1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QFzXp/q7
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-499ca65ae87so937559f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795337955; x=1795942755; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bt+vNC5Ck7Tec+thZqwOgrn1YnZYE8U6h78l2ePZXOA=;
        b=QFzXp/q7PjWMZ28Y5Lr1/zoEik8SAq7sQPaC2qab1BUi7I8P8CErBtSXnqgJ6bfcAn
         qlWesCnZGgYG57AyXZcqgnUxXJCjdDOpHNcpbxl/crBBZHC3M99jWrlapZoLe9ovnPZs
         D6UBasDTgAbTtS+SMr8QHOAYbjrxluF3EXNkd/fUhlAYuXV7JagRA/4PGB52eijAHMxm
         hME/U6XOSwQBdF7nlokjH+HzR8KP96cNyzFc3c1F6hcqcMslUh/CVAatsXUvBuV2jR2N
         KXq41sSuZdGvpOpHW799q+JV5dKhtf1kRMALmBRee64ppY9+zrXrsnS/L2auAvu116Vp
         V/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795337955; x=1795942755;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bt+vNC5Ck7Tec+thZqwOgrn1YnZYE8U6h78l2ePZXOA=;
        b=vgnIPHwIE64qk435M2Zrlc/GVI+2l5MREKSt9S6+x5RO3fLibovrgGwjulw79JCQSt
         gJkQhT37bsPrWw1+fw5glds6OeG8QPmzsB6yMplolm5FkLKxoXuer7h+GL1eMrMSqzXT
         gIdzSmyMsF5TGVcY7xLEI5lXokyNhuZnlsJGXWLKotUBogTVuXsRDVghfhqYTbyHTqMW
         LiWasd1EpgxD6U/sE5TGs3sQZ+nuxxLp+q5tlQ9l+BczDGyxA8oCa6Xa76IIuoLw97KB
         FbvH56wVt6zbpml0XJeUMRsS9pdfW6zMxF9YyL+G6AzBUqYERD+A1QT6Yd8/lkGRZqwl
         URDA==
X-Forwarded-Encrypted: i=1; AL+hErG6Jvr3CD7z5hPc6I4XyCuszCmuH8rZtDSdo1+OVla7+uXNdEGjfJn695Lcm49upyB5aDZmDHYq28wyhyk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sN+ncswGm1//tyILjDtwhbzMUTYBQN6KCj0fswPhClZPC44eT
	peqqmerojP0FgClnyl2eG50LnIG2+zT/0kJpX/dqZRv2vEyPIjodCGMQ483gUPMWnY223XL1mJy
	Vq6Y0l3hF5Kr7LfQ6xw==
X-Received: from wrrv2.prod.google.com ([2002:a5d:43c2:0:b0:48c:4566:c9eb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1e50:b0:48e:60a7:e0bd with SMTP id ffacd0b85a97d-4abb2ecf9afmr12805799f8f.17.1795337955311;
 Sun, 22 Nov 2026 00:59:15 -0800 (PST)
Date: Sun, 22 Nov 2026 08:59:14 +0000
In-Reply-To: <20261122-tyr-reset-impl-v9-1-ed42d8f513ec@onurozkan.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122-tyr-reset-impl-v9-0-ed42d8f513ec@onurozkan.dev> <20261122-tyr-reset-impl-v9-1-ed42d8f513ec@onurozkan.dev>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122085914.1094403-1-aliceryhl@google.com>
Subject: Re: [PATCH v9 1/2] drm/tyr: add GPU reset infrastructure
From: Alice Ryhl <aliceryhl@google.com>
To: "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>
Cc: Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, airlied@gmail.com, 
	simona@ffwll.ch, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, boris.brezillon@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 08:40:32AM +0300, Onur =C3=96zkan wrote:
> Add support for scheduling GPU resets on a dedicated workqueue. Track
> the reset state to avoid queueing another reset while one is already
> pending or in progress.
>
> Use an SRCU based gate with mutex-protected reader admission to block
> hardware accesses while reset work runs and wait for current users
> before resetting.
>
> Stop new reset requests during teardown and drain any queued or running
> reset work before releasing the device resources.
>
> This is the initial reset infrastructure only. It is not wired to a reset
> source yet as those will follow in separate work.
>
> Link: https://gitlab.freedesktop.org/panfrost/linux/-/work_items/28
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

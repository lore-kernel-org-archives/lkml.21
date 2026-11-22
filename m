Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795337960;
	b=k1aHRrGvLUslavG7vcBn4H0fY+3ZuTXL4SIcN0uxzZB3Zl/+3DiF2aCHMUNHRaJOE++6
	 3fR1r+VAida9SWQzQMRNEn5Ish6xt+S9XsJiEJbw9BDgs1J4absv8Cu6DgzFh+4AP7y4j
	 q3g26iJdSeQ9wC864PDO3C17TjAehCpwuWz8UQe86P4sGBtLZbzEMuTxhhqEjnjJMmeDO
	 49ZJaYjw2vIVcrVXKAxA/moWBdaijEbZv/nxIPzHxa1fuEw3JUXdjOPRMzowDns4Boey+
	 wJTkmH1pOCoVgks3jE4eoJqYdIKElpunH4HYxGbNrYWy8RX3MdsG9Utf1AuBU21xTPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795337960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=2xtn5830lTNiRdDIiYhj5d/UObB+cYcE2nyc42dKa0Y=;
	b=GJ80T0iG5hAVvVLyx47V3KN31/Yicoe0vI8HUpBHuD0ckoBrm9j6nhx59VN73WfG7oYW
	 m9RIsBtOKaon79tQEDKQBU8KHMNazXCf77qNBPvmImWj01m/pPy8Zs8ML4qFkrj/4Hrda
	 XPBoyFikJOtep8H5LTrDi5tDDEBdtuqZcgVKfo5QfSqbuIDFuPBrJFx6d1PaqlvLGHEgN
	 KGnQiGe0Xe1DPZk8VkJppr2wHkKL7TsmpOcfr3KynEbw7yi4nnrIbRCPLXOF2l1HRE2Am
	 JdcA9yYlMi7Q4t8SWppPg3wyuu9qTBmuPJLK9G3KEOSWkCKENdDhFN+ThBpzYVtQ5yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hEtQQnKy;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03D6606A33E
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E03D6606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hEtQQnKy
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4bb66fc3aa6so21939745e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795337958; x=1795942758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2xtn5830lTNiRdDIiYhj5d/UObB+cYcE2nyc42dKa0Y=;
        b=hEtQQnKyJBzQvrv9WjCE8H3ZqU7wxX9gLJ1UcKPQR+IZWM/wTKSvsT2HgH7xMmt3kC
         IvVjvIbmukDLON9fqxY9Gk+Pazv2bPzDnqexJMe4Gunc0duIWYumQkbM190W0BI4eoy9
         96FP9vMch+B3jdiFgaXEApDt84ci9kDrdQEG1x73Jf2aeLqfv+2STFMBD0IyuP70u9CV
         18/wfBCy6FPdTJv3X148uzHCzh/WHsS+X+j5w8x9RmqpT+0qDxTMeacONggx0F6UAguw
         wjS3NOjLZts/DOj46iZrA1TioBcGnRgieGdDWs3/gm5WfR/qKSHoW1AwZIZ5r+03wWEC
         C5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795337958; x=1795942758;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2xtn5830lTNiRdDIiYhj5d/UObB+cYcE2nyc42dKa0Y=;
        b=d2F1P+UV86WPOrcQ+jZiGtbOQYOQKcID6puDnNW/KtmI8NmMkp5HAhhpIalptDaxsK
         wxZFRf+AL7MjFLx3LEs+6Jfi5FKY3jbrq0Q3UL84rLyBbzN396f+njKOIv5HVbKtilgy
         5qr6nQQGpf5LKtk3WGWJdWrs+eiGgdJBDdiIVyUBky7+kTQ71ABq8sPkhL3YHBTA675C
         gqY/aLNAZAnMbiPIO5GVO7IygMDiV/BhRaxGW0Q5VbKLu8bp4KqOySSRHTxSXb4GDy3d
         y3LmyesJD65WM1jNeBaYLk5bpPKughxldspcUJazt8j/OQ7nJgy6XGbRtlxnnZgz5Vzh
         0FKA==
X-Forwarded-Encrypted: i=1; AL+hErHmElFoJy+r+BvWCOWvNDo5MeJfMJqe3BQQzsfhhkAyp18IniEmNLCFCbOG8Ovsp/sKnR7EYsemkjUob9E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Bg+aRJMNqzaPnb5jgUlKaIwcGhIm9/whYdo/1DrrSOzCJMAld
	TfY7J/SXcLY4PU86/uT8dJdhPCFUQ04Wm6ymB7CWToQE2SvvVMYtdHsDIks5vakCGvX62mvijfi
	Xyj2d49qbePB7mUD5Eg==
X-Received: from wmmo19.prod.google.com ([2002:a05:600c:613:b0:4a2:1824:f77d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f42:b0:4bb:5c5c:8130 with SMTP id 5b1f17b1804b1-4bb8881c726mr211965125e9.5.1795337958222;
 Sun, 22 Nov 2026 00:59:18 -0800 (PST)
Date: Sun, 22 Nov 2026 08:59:17 +0000
In-Reply-To: <20261122-tyr-reset-impl-v9-0-ed42d8f513ec@onurozkan.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122-tyr-reset-impl-v9-0-ed42d8f513ec@onurozkan.dev>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122085917.1094675-1-aliceryhl@google.com>
Subject: Re: [PATCH v9 0/2] drm/tyr: GPU reset infrastructure
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

On Sun, Nov 22, 2026 at 08:40:31AM +0300, Onur =C3=96zkan wrote:
> Changes since v8:
> - Use workqueue v4 [1].
> - Drop "drm/tyr: clear stale IRQ state before soft reset" (applied on
>   drm-rust-next already).
> - Minor fixes (Alice's notes on v8).

Thanks for the updates! Both patches look good to me now; I've left my
Reviewed-by on them and we can apply this series to drm-rust-next once
the OwnedQueue/ScopedWork workqueue dependency lands.

Alice

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795165873;
	b=PzOOLSoE0fSad2nounoYL970zURrO9XGyDPOqq13sg7kR6OjSxS+jEl4II77qnfflkB4
	 erIcPWfXrHpGtczSXfkTtnFBjGiqjGC+Zh0qZe7NH40EFhe76WKJuLiFljUjpapeBWO5z
	 qyEu8uvoUYtZdSC8DSPiihSs/ux0OKNeP7xRH/nLqi6tj4JzO5QPBr6wPs2EUEoy57VWG
	 lVwH0xm5FT7pXXKdHaYwqwoBBR40pZf1lOCfhzWjXUF93vLfe3RTe0XqkS+q12btAhP1X
	 6k42BI9RP8BrGEmVoAhYFK0qxYN4t9VZToC6aow+rwfYeuUwrcSYv4rUgulXiQiUHJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:MIME-Version:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=t6+MzUMr4/60YFoNkihAk7XxnE6CVc2ryl4+p1jYN4c=;
	b=S+m7xBDstTt4Pe9jxB8HiOLifoLdQK+nk7hsXRiW2bremCzd7SGlxgDKJMszfcw0kyB5
	 WJgT/LG0ameP+Tq9x7ke//IRQ2KTCS8RIlwOOnfTj6oY3uruM1Be+zPQiM070xdB8AfAC
	 CFwv+Vh57CS+Bj9xXRqSFz+MHstDdX1+BKAUqv39DIkKjBug5UNZh4gDxDsKO+PJ46cjb
	 /sJfbEu4+jKbPSkHZDmN5AOugbIYq7qU5lKeMhYT+CjENBPzhmUcnarNxvjfwvBmDnjvA
	 o1rmBbpTCC2eUlCW4sY9Gn37e7dm+lc43Vez4Du+mQBKtxwsl4txeWFYPCrlGZySP6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hgkEvVgq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9360E606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9360E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hgkEvVgq
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c5133831027so98649866b.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:11:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795165872; cv=none;
        d=google.com; s=arc-20260327;
        b=bdLyPrlC7XdruCQ5SzHEOUC3940xh1BMUMuQIpSX5sNJF0s/zq+tW1xcDCRMZnIpid
         kVWBI3A2CO0f1VjX92iWlN9Ul6iZ7UEzyTYyDZ6C2vsXmUX0M8TvsZX5cey5GwGsaS5P
         srBZndfgdMHqBw5p6ERKKG+dKnp3anl8RdN+bjE5UGS49NVzypZBN0GOT8HDFEHCUNOZ
         6BEWch9LUusaZeRp78uIfmyfc3s65aJs6yCl1jNyKyLMV6Agy0V8NzgMCnQJE4CvKr15
         vpxsAdpx8SqKmi1I1litFPB2F1wZKrhikJvjMhgZsLtBfJA6MOu2JEkciueONFBvK9aV
         k9fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=t6+MzUMr4/60YFoNkihAk7XxnE6CVc2ryl4+p1jYN4c=;
        fh=MVRpEo4YHhV58BNSMg7Rp9IM4r8nNGAh/QzThI2B8y0=;
        b=oEJZ6cd3tXmeuE3kDqNOn/2beH7r4LgT4v2FdfrsHLwX70E9znQZOV4nIylR4K5NBj
         7Y8qe00G10yW50XjRkj97qjkCYPTU8jW92fvcm2rOeY5gF3tGdwqOriv/7cYCgnIAtJG
         pyIew82fZRSSSSUBcQdLxy58W1QBdipNEzQbg2noco1clawtxdvNSLWfLmORaNqhXv58
         DfGlj5i4PnXxAKFTIQaOgVXJNxfFCoGJrDxp0RPpTNsauQrEB/Y3UYHgjfJtnnfFJ9es
         BIT+OOowq65NHhAnLhB9zqtczwSwLkuyGZP1IYZTnw5Oi5LnTtA8XryuDbj0t6TfcHx0
         ItaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795165872; x=1795770672; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t6+MzUMr4/60YFoNkihAk7XxnE6CVc2ryl4+p1jYN4c=;
        b=hgkEvVgqEaPFpmfvRrplW8cGj5JZV0pAXQ6JpsQaS+6ZWcE9fWOBzFkORUExz8iNoP
         Jlns+FErjOmrk9AlEmbjgMnTTNQXbI2T8CqXR+zCJgQ9XpnxZx2xeSCDd/boj01jbJt+
         tWpey4gY8WC/DguMAZSGA3JGLxRWGhIqMi9c4LDSgJI5lw39VE4Ernii77MWdmopmAWY
         nf4JA4mW5iGAUrZjbO9h0zfPugjhfSmIeorT2Lh5V7mhrVa0wvV5du/D8nQCVhH8+8Tm
         LHHIQZtQYE9Nvc3CVPVD0AqIaszwYouVp/e3000uJuxtKPR0A0Hin+zs6jx0YMfTVBEK
         ivuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795165872; x=1795770672;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t6+MzUMr4/60YFoNkihAk7XxnE6CVc2ryl4+p1jYN4c=;
        b=gOty/EXRpzRgviUcxUho268yjvmNqSGlGq6IioeHhj7GP9a57dgl/Ev1dqCsCnKME7
         3ZkJVzZZZ/78MSKBrS2Xyn3mYTLMAO7pVB9q2Fmc5Fl/YOpPYBVYi4m9As4cOeRmR9RJ
         UjE43fcJ7PZyRaBKEfuUTBE4z+sQg7o2WHgC8mPHMQ4VvIr1ebs6y5C1rsVbzMmVoaQN
         bGS87u4+RtWez3kEx+xa/1O26y78nm+kSxyGRI4QCF8Abn56lWCB3u56ymYG2XkWxCJ+
         yNtEMAmkIwQEgdD15SHzckZyW2xPr01HXid5+4wBPvGiTfg/G/D6lG/8SY+OeW6bsQAN
         9dyA==
X-Forwarded-Encrypted: i=1; AL+hErEXsXsNelpnUuu3YfFpu1NDvNCTH2qqAPnFB9xvdBuWeZnW0g1th/CTYa2DiDDNsw4bKFG9CxACtZ9tge4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yhIh+/enTlVA84XefiR8u2ScgQJcxbvGfgV/wsnSfMuYWCFD2
	W4GeWwPsbRcSR36qfgrDRQZBW6lqIsiTLaVs6r38TEB1N9rM5r8t83O5aEG3/WZn7dJQYvKMU6k
	ScRfa/I7873dNe4qYjyPWkqnDpsbpaSk=
X-Gm-Gg: AYBFou15N9+jAXdA1s12toR3jb7oNH3Wp6jnOi4vyj3Lq1NlyZJHny2kqbS/2u1xNBg
	mdffVPu75dcUs0B6yZanAT6qE6x80f29Qi75LlMsRAp/lStGvbLhVvsiPRoH+B5rGqPb0qXQshP
	t/f2FCrh4MRQb1lvtGCnDzBpB8ey1wSrwlb7MIx5bE4sl58yV9PgtF1+WPf1G2YtIuIFGVWJlqX
	CBif4c1UMjnbCSiSKUPzLxJztPMvIHZAhQ+n1R77T/PAgC41jQnWvArzmB3f/Ki5AlUo9VAJ8ea
	OkC9IA3GY+M+QCJOY0jGoXVowaN8SfyyY03iCUfRv5ULScqM/y1D/y/TvN5F4M41RdyTqJmkznU
	76GibMWBdZWAFsFV8AmxC+K/aEIxg8ev9dfSM8hRDRA27MuRXFv2xBqfiig==
X-Received: by 2002:a17:906:714a:b0:c2e:8eb7:53e8 with SMTP id
 a640c23a62f3a-c513a85d035mr137762266b.30.1795165871790; Fri, 20 Nov 2026
 01:11:11 -0800 (PST)
Received: from 118528743069 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Nov 2026 01:11:10 -0800
From: Christian <servidorjarvis1@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <065124a2-d042-4b50-b9f1-3f6c648937b5@suse.de>
References: <CAMas6S3zMKwb5KZ-UNnTd92hZNN0CONY28bROWbojYHBNFCRgg@mail.gmail.com>
 <065124a2-d042-4b50-b9f1-3f6c648937b5@suse.de>
Date: Fri, 20 Nov 2026 01:11:10 -0800
X-Gm-Features: Aa3M54oJtBE0zXKo1x_1wvwSqKYQgxEMspxKwxuXHwVkxI2QPXXcrYjMd3U9iRA
Message-ID: <CAMas6S36SMzOQmzDS0dkk8y=ujvNrupQFyZTU7bYfwAqBptX0Q@mail.gmail.com>
Subject: Re: [PATCH] drm/simpledrm: Use vblank timer
To: tzimmermann@suse.de
Cc: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	michel@daenzer.net, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

Thank you for the question, and sorry for the slow reply. Trying to
answer it properly showed that my numbers were wrong.

Re-measuring today on the same machine, alternating the two kernels and
forcing the display state with xset, glxgears with vsync gives:

  without the patch, display on:     ~60 FPS
  without the patch, display off:    ~1.4 FPS
  with the patch,    display on:     ~25-29 FPS
  with the patch,    display off:    ~1.4 FPS

The ~1 FPS I reported is the X server's deliberate 1 Hz fallback while
the screen is blanked, and it happens with or without the patch. My
"before" run had been taken after DPMS had switched the panel off, so
the comparison in the changelog was invalid.

Please consider the patch withdrawn. Thanks for asking the right
question, and apologies for the noise.

Best regards,
Christian

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789672;
	b=kJiw7DOuoPYtZczkDA9Y57cKGLywEPAJZ077+5xqfB8Up2ZySmKl1038mnE2xKxcy1FG
	 MEWc+r39UxNk/PDTntk+XGlV6pE2ml8NDQBhxNPXc2y+SWbNvKpkh7g/u5tbsSsrpsoE/
	 JwqtVO2YHrq/+qd9PAyKhkGG68zp6yoJtooZ0uMZu2kYOji6lZBOmdLI/52VqKUvaPUKb
	 nTi+Jj/5EDWJtKluvPhhhgeBJCZ1whiGlwLFhb+VfZDqh+CRZ65fnmOW5ru5I1LbXCprk
	 rHGoIvdwJ5bLbf3u9tF0pi/UO5U4o3PDA67+W/2L8JINIC2mUsC9TAc84XD+ABT4xFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=fmwxBbYiNPEFRVig1qeC7kHZSiWSAH+dmCLjzHg5iBo=;
	b=J5FPfV/jvDp41n5qYk6GT8ltI2omhREJYSF8LYVe2FGq9aDgora0Uxkd8L91T8wVDF7S
	 alcuVbzKktO+9MjBcZU+z0lUvBPcSYlZkiPmvw8pc9leBC8nX1FJbeBDhscJxKj9frjvp
	 T2wSXznvCReAgOPD7wIEVKgXdHg30HLO/ZJpEJprfwFzAYs2BqsZdYPioID2AI6kHdDS2
	 We8ddmb1Gg0Aooj8WuoWxiBWwNcEI+3NgcEHentMXzhU/bT3xQaOsJKsnIicyWFy6/eEe
	 IyUXUbZKGKEAK8/wLqf+I3ZKtV2xeIhYQpyzXxWGPq2TdKyNl7d4oy9JO4eTzWVCMlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KhAvzGst;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B3B606A724
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4B3B606A724
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KhAvzGst
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4bb68d624baso48837145e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795789670; x=1796394470; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fmwxBbYiNPEFRVig1qeC7kHZSiWSAH+dmCLjzHg5iBo=;
        b=KhAvzGstpDXMZRfcStx9CvVCbkFHRYldWEODlqycEfI2+y47e7mxX2zpAPqbZ66Dov
         8HL/HOTbAdfVCrChbMSyA3OWeHTaLkCtnwaUThAUTuOfWeEB7D2V/UnVboSR6zywIesr
         +KFjPTF2vP1kvObXUDCnUjr4RZ0Xj9Pf7UMCKYVqr3UTlvL9/6niuop7i/YnnVQWXIoH
         jIN/leia+g8GIHyglhzUyZSFmCV3b/gq2/auS4EdN+AZ4LH8ftZ71mBD6P6HD6gHXsRY
         v593/ZvN9Au5rVsZF0/57Zrur8m/wYRTG+lDv0ny6FXFiKgjSgJdxNm7RhI5JYaEYZil
         Sdww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789670; x=1796394470;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmwxBbYiNPEFRVig1qeC7kHZSiWSAH+dmCLjzHg5iBo=;
        b=11Gph0qmGMtxy7k8rXJ3nvdEtBbmNuRXUgw4U84LsfN6NomfB0Kb4wHPoEMmKhuZi9
         7tKY1hKaxQ5IuZmj9yeT0ywpMGGYFk51raf+IZTuoRDQtdXayTMJpB/v7mFIBgWih5im
         JJWaH7ybppLEUn3VN0xSbsduWbTdekKQofPHzaSGPR4S8NyKwzADeWTUd0LKmz0mZYbP
         jwnqZ1az1/zONb6kNUIGLkYf9NW400tB7A5mwrszDd43zYfVCDEKXK8SnV2OsDfPHE+j
         gSR5mxs6mzQNr5u5yK3Z30CzXo+cFLLXSPDKfqvxG1b0URIY7ctoIPkxYWCzbSGUluNu
         xdVQ==
X-Forwarded-Encrypted: i=1; AL+hErHK2+AlREgPLvBix0/JL5jJjbJs8LAO9T9gDMFqKN+CL88OOeSOI/rjmOLSfavbPDHV+hadhyff7Tj0diE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XLljgC8JT8W2jI9TTBVAmcmBglbuCvqRP55bZplEkO3AgwZg0
	HQpUgToqUsufRWCf1GbV3bU4uv5wqfZFTqRzqftl5MHYyNYjOmX0BV0pIBzxgKTxQaOl2d3xFN9
	k5ctCWBcp1oOY27xswA==
X-Received: from wrqv17.prod.google.com ([2002:a5d:4b11:0:b0:48d:efd3:32b4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8210:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4bb887865b5mr500739915e9.0.1795789669930;
 Fri, 27 Nov 2026 06:27:49 -0800 (PST)
Date: Fri, 27 Nov 2026 14:27:48 +0000
In-Reply-To: <20261127102232.74796-1-adhyanshverma2010@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261127102232.74796-1-adhyanshverma2010@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261127142748.1874983-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust_binder: retry ready threads or fallback to proc
 queue on dead thread
From: Alice Ryhl <aliceryhl@google.com>
To: Adhyansh Verma <adhyanshverma2010@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Carlos Llamas <cmllamas@google.com>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 27, 2026 at 03:52:32PM +0530, Adhyansh Verma wrote:
> When ProcessInner::push_work() attempts to deliver work to a waiting
> thread from ready_threads, it previously checked only the first thread
> with an 'if let'. If that thread has exited while waiting in the pool,
> thread.push_work_inner() returns PushWorkRes::FailedDead(work).

A thread in `ready_threads` can never be dead: `Thread::release()` is
only called from `BINDER_THREAD_EXIT` on `current` (which cannot be
sleeping in `Thread::get_work()` with a `Registration` active) or from
`Process::deferred_release()` after `ready_threads` is already emptied.

So this case is unreachable, and I don't think we need this change.

Alice

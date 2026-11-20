Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194151;
	b=ssWeW/DC4dvAH0yOm3ssK0QHD70SxHS9BLjnr+6wOTEievq5UdoXV7XsRVWTmhJlmNwD
	 EkfvesBj3Pr8oQlnYEgDqTp/g5ha1isgYYKDursOYIST+OeTEz1LDcYNwfqNfOSxl34ML
	 JO9Vmg6oBqwEsc+0JtI8q6pWGJOoy2wqUkKzGTJSPqiai/y/ZmGbc9KF7aak0ZH2H13OC
	 iNpulMlJ4tUjN1Ee5pIBImozKb6mmEeTmLNr9A8NKv4wdQMdIQWCpnTtaJRM1ASx7I8rF
	 Hh+h0DWc2N2UYDlaZ4hdqLZ847xbfIicHPydXlweofI6FDHVw1Q+vaK++we2y/VradA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FwHWB7P/0a48tdW8YS81QQbTMddEmiTEmcYnkEG+2ME=;
	b=1DWhVbctOJGyDBIWXOSF13qG+WXZUxeRCSA05pBXH0TxXJTh8caYIsH0rW2f00PjU0ox
	 BP8BF7liCkP8UvncemeH/uOicaIR8XbmlanjLMdd00ewBdTwmx6RhAUc1koQ8+3ZlFnym
	 vEt6WkLOFuyi196BDg0M19/tgrYJ318uAoBBb0Pd+Xub2lCKQsZ5UFWY5jf9GS8BE3Pm3
	 Uuzz9kWmU9lK+Q5qrtK9CN5O9F6f35ZBpNgLjqgwBaEgGy3u+G3w+4jFpOtiQd2j5IANR
	 AScByibIgeJTySpeftexNri6LoFZP9Rti5hlw5vVTiADcDs5Yo/+Uy/SA4haiuBZQYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IfRrAI1A;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAB060A2614
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEAB060A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IfRrAI1A
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso8472695e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795194149; x=1795798949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FwHWB7P/0a48tdW8YS81QQbTMddEmiTEmcYnkEG+2ME=;
        b=IfRrAI1AQYFkLLWMV8ai/rArqH7I/ixvzrZzMvEwCpURX6/6N1D3pn6GtG2Btg6EMk
         7Pw2bz8YwAPrJEIrBXf7hM/A2TedeSTD3A9TWu3AVUl/ggHgFCnqXsxA1kB8O9pxOTNw
         TF0Kt0jVQ1e6mdFPUctZwyGljc2G4pDgzVOTIo7wwjkNCVEOY6EB6rFpp0J7a9UvSuF7
         vb6v49NTEplRccRjGRjWFlyXyhWsOS4TQPwLS/NecXGcviIyzkfREtR8EyW4Uw+n11sH
         YXQp1cHtFFYtXQzhbqR+COBJ3B+ojfvSokQivu+WWgxEwmbjW/ARhgdETe0slgvzPIiF
         tgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795194149; x=1795798949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FwHWB7P/0a48tdW8YS81QQbTMddEmiTEmcYnkEG+2ME=;
        b=O+HXeX6kO/zGdEIyCdwxJfqdkJzJeidtySy+O8Z5/cgYgqdBDkxo+ct/aizCpSPNp6
         LHGi5JFpUUlijogvTocu7enijxMb4XxdxNur0fViuPa59g/kmRBsQstKoDqyfvRBtJO2
         7nnVl9eg6NinelaB/08yd3V3qEEnx0uBuDd8cYu/fjSGuVi9Pa72xwXFuNJSSH1sSF+k
         P6DKFGr0LfPW4pijZXBWKRpzJUY9BAh1PJ5dXeVbDtLlpZ08ix8g/bDKgcUt/z2DgSsz
         K5YHfT8hwHM+BNB9zHludaSqIGvPeEcGa3SOj1EFWZO2FmzpeqAGM3oms/gWD9f0/a2H
         rAdw==
X-Forwarded-Encrypted: i=1; AL+hErE8f5AMRnlWqCuZ6ojGdevOd/laDm7WGY+aoaX+5iaY9hI6uLIjKIoXZT+7ORyMw3EGcKH+FHG8J3PNqXg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9H83n9ULS7CQtcwUQ09AJTSXq1bg6t7dQJ6CYSBA8pHXxdu+sd
	pYygD6E1KH4/zS6tRBK2FVCxQKX5X1G+TtLRu/qa0n2Af/Fmi5nvNFAK
X-Gm-Gg: AYBFou3pPsiaF4j21yfLLIt0mcFdAMf5ygQ21uLfz7nukD0S52prlF3kydkk/SaZjnn
	T4CJ2spH4eRI+/hpirVnXf2IiwIyUyYJv9nSstEuZeiitV0pAFHxhKDy1apVs2rBngdpOLiWEVK
	ixSwc0eaSS85LZeH5wA0IOE1MHL6/kfh5A0W4oRfqrOtnV0HYTktNxQivgz2tFJgSc9BSZGRvWM
	nymBnj6dYZb6A57H46BAJbJrhbTYDDEATQNKo5E8jD22b+j+1OiSf9zRnnY2gM7RkZKLAIjaYxs
	WoI4fMjioxoLMnAtdm398vqlbruGboqBMdhn7+/G5w7C+hKM8yTvfFTR7ooV8A1b9yBeHId63VX
	f3YKyygbh6J7fCAmt0O6NQ6Zn8NCXzTFT3f/b8HvRJmQDMzHJOMzwmtcbLxtfvqXbhDYn7BWuYa
	+3baJ/u5aF7Crq2t76xJp5BOXDF9+e8X1TCDwfpy3d83P62ZqyLjsDGjVcAUNRL7T3iWMdZaAtV
	cjwrU0K8xf4DqFK+k0EEvPca/vrtJP/I/CfwEe23v7AAvJ9grpeLdsUsklhU6ET+wEcLtC5ckDK
	+Z+MQpxEAzsSdrBKd7jbN+hDiACjsjb2G6I=
X-Received: by 2002:a05:600c:c84:b0:4a8:9a2f:d27 with SMTP id 5b1f17b1804b1-4bb8881f47emr87073955e9.25.1795194149145;
        Fri, 20 Nov 2026 09:02:29 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2050f1sm6345804f8f.38.2026.11.20.09.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:02:28 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>,
	Zong-Zhe Yang <kevin_yang@realtek.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v3 2/5] wifi: rtw88: report the frames purged from the TX report queue
Date: Fri, 20 Nov 2026 18:02:27 +0100
Message-ID: <20261120170227.374774-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120131000.33858-2-luka.gejak@linux.dev>
References: 
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

Hi Luka,

> Could we clear the TX status in rtw_tx_report_enqueue() before saving
> the sequence number?

Yes. With a test build that drops the firmware reports, a purged QoS
null frame reached mac80211 with status.flags 0xff and link ID 15 on
arm64, and userspace got a probe client event without ACK. v4 clears
the status there. Since the patch changes, I will drop your
Reviewed-by from it.

Mehmet

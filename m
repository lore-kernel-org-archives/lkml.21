Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190912;
	b=LF25oGKKPeoc2RGzQCB202N+bAaKm8S8vAXUW7/+V6p6XW4+EB5+g/EUnzeL975Tz+E/
	 qXgyuINRW74LBcWrU5Hqp92sViSqMnD/63uLadnGXc5xMlmrGXr2ZYANXfG0q3aMvvEGg
	 48/Q9vlwNCYk2tXb+gs2yyOkY7+8Kf0Ql+h0Efq4cIPikSiwnyLzaMgtNT5YW4OotADal
	 A5/jziZGiSMVZJgclbFX4sYhXfDD93LlPBWDy60e3xjV0FNDPgzmIbvm+gWvGYyDuvkbC
	 0KpraUeOYqwtJCB4StzOgQaYlQ9RmafOQ+UNTMBh4IDXk8+rMTPwzQtBwQDC8aNdCaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KJHdeXgb+8oRA+Qq0eNkR56itfHtyKGNVrXS9DvLfB0=;
	b=ExCPI2Irf5N8gzLAXneNlNV8OFntS/4o/WUXRee0GwNfO/vmsKqixMCVFA6TMsJHbLN6
	 Z3RQssBmWhEEOP5RlIYt9xv1WBsiKQWpO/rXlanNlg2o5IpkMzpoQgll5fIzGNxevOzX+
	 vq6wxZfRKzh7SH2Q7JHb8Z5bE4Ubgk4WyNOGBStRYvSQdB6tvAnoPvKZfbSwco+Pn4a5U
	 a1LekiXRFw1nvFdQcGfrBLTIfaPmRgHM6BVd4YsjyJvUecQcGCsPhCuiZdrBwQzUYmY9M
	 UQ4CKp4fsGZWYFaBqmY8IaRDCn/Dtvwtw5RrBVfQ1DJ7nrOGftlwUWIzzO0d0ALMzaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cuUyZqwV;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F36B606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F36B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cuUyZqwV
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so852185b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795190911; x=1795795711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KJHdeXgb+8oRA+Qq0eNkR56itfHtyKGNVrXS9DvLfB0=;
        b=cuUyZqwVRtfVW7vE8lx1+x9WioLQ1b28O+I6Z/BeSWzgR8e8P2++UfLkZbbFEXxhE5
         S9NgC3FWjt+S16UPYcpgqt9a2wsg1sIrPXExX7Pgc9SEXoJgqFgn9stwySib04t8Em2D
         PmIWviqwi4pjOiQY/nhhtlChPjSgnLjE3w3f/ev2qG/mCHI8XUo6A3qxHXtDnq8Q1K32
         JI5LtL342JitpqNhVxqSGyLQ77EOPORqHW0U/sMIYhic1haSzHG3OQq9qnFcTtQOwSWr
         dX0D2j8+Etjgkvj8ZnQHsSBzOZxQRA/1TFYpZ2vPe73DuQo3KcSzvtXXC5iqTpyIQ64o
         X2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190911; x=1795795711;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KJHdeXgb+8oRA+Qq0eNkR56itfHtyKGNVrXS9DvLfB0=;
        b=SKgGJPCIc6OQg2YvUA+wTDczH0aOx8SH2IdOGdqD4kBaQS4HJm7f0misrW6RdVagZZ
         IKRz5hgE+Za3tLEV7x2a7U5DdpoyAWoPy0qrJ8ZLrkGoxwGanp3x+T1VeQl5BOl3/hTJ
         ONACGnidbYHD+hwHWLu2+X5ohGS/tLlhMyburTzQsqKG5sRfIiFXiAOujt+lNCMEzZOx
         AKW9T74VWOC1E4VGhWWxAWSPKS18zLa3BEZBxEhLohu1Pd89rZD6FOF9r+TA/h4W6yCr
         N/9lFhCt0XhaArIMn3rCgW50L9N/JLfNn0qmuebuKbJW/kxJG2SHLOr1huThV5QHv08t
         X1Wg==
X-Forwarded-Encrypted: i=1; AL+hErFZJvq09BY77JqY91y4ACbscGBh57w/BsnXO7cH75ePliO9HN8tx/5vZ/wx9SIQjZq7nw3dlI89RzlXSdI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/E+l4QXknNFxfWTwXAFwQ7jqgcCIcroS1PJ+En89PFocIijZmj
	BWofl52XVM2yyZhIfl+Cu9qzR845mJJfPPcTWVyZQ4K8h+DmPQ39DwC01tMzGiitRlr/TfL7NSX
	coIeJgyI=
X-Gm-Gg: AYBFou0a0YTDmYjeXfc51jF6zxJcewXjqCX+D6/y3vSINxMWxJtKez9xfStczFoOULx
	U6HhJRmWnXrHB1SYm8YA8Wnl9FRWTdopDybNPcV5vGG/7asYbGDngeE8RbFmQVTWcVcqY+kI4jq
	cejiPAWaXkZbpRWxnr5ZBe7QPzUq21OKj1ebqCHikW3YPDhacHsYtjWKkgrzXMD1bbNJeznN6F1
	2VcL4aVaW3GdLixVGOtff2Lr2WDvd0zFefxYSPtcGOPwk6olwnJYKBvxLxXHCNWc4y/ERnCIQkw
	3bnzF1lNRT+eOc/UCVn9CX4A/TmQuLpip/t/ky+eMljSsgYLaEjwb42kecV2b8z6Hh0uI6UmsUC
	UKaKXyA+f6vi6d9evdWhnFBl95YJJxNsfxoesDf02r4bcdk3UAL8L3nDZVDwcxplNQeDv/oT58l
	1KVjrGTYZt0TbaB/VirTSQAaYEQ5qqqrv64AZlAbFq81t1gmt+zYtGz9fEeAst4/H+Bxzq5c9Tj
	LL+8erAm95dX/RUcx2VxkQr6sI1fdbx2Lm5YvYZUfHbAZRtbDplOu1m31h67GvGA9SLF2qigyaj
	qzFUv7qqzjKyTO2sJdys/V6OV+NHENwvxlU9QFzrTXbwPxtMLEsEedqgbxWAOoBnhfn2nKz0EGl
	sccDVZ2HWxBQYR14OCZf0zakAMVADOfXw5//H
X-Received: by 2002:a05:6a20:7a9a:b0:3fa:5900:6e44 with SMTP id adf61e73a8af0-40205f1edc5mr1443887637.52.1795190911331;
        Fri, 20 Nov 2026 08:08:31 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cea770asm1552917a12.3.2026.11.20.08.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:08:31 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgs201920130244@gmail.com
Subject: Re: [PATCH] usb: gadget: f_tcm: do not dequeue UAS stream requests in BOT mode
Date: Sat, 21 Nov 2026 01:08:25 +0900
Message-ID: <20261120160825.3219262-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026112031-sandlot-idealness-df6f@gregkh>
References: <20261120113956.3071640-1-yhlee@isslab.korea.ac.kr> <2026112031-sandlot-idealness-df6f@gregkh>
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

On Fri, Nov 20, 2026 at 02:42:56PM +0100, Greg KH wrote:
> On Fri, Nov 20, 2026 at 08:39:56PM +0900, Yehyeong Lee wrote:
> > @@ -1614,6 +1614,10 @@ static void usbg_aborted_task(struct se_cmd *se_cmd)
> >  	struct uas_stream *stream = &fu->stream[se_cmd->map_tag];
> >  	int ret = 0;
> >
> > +	/* the stream requests exist only in UAS mode */
> > +	if (!(fu->flags & USBG_IS_UAS))
> > +		return;
> > +
> >  	if (stream->req_out->status == -EINPROGRESS)
> >  		ret = usb_ep_dequeue(fu->ep_out, stream->req_out);
>
> What prevents the flags from changing right after you read them?

Nothing does.  The same teardown that clears fu->flags also frees the
stream requests, from the set_alt work or from .disable(), without
waiting for the commands the target core still holds.  So the test is
wrong, not just racy: the host can take the UAS alternate setting away
between the test and the dequeue.

v2 drops the test and puts the requests under a lock, so .aborted_task()
either dequeues a live request or finds none:
  https://lore.kernel.org/all/20261120160616.3219043-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee

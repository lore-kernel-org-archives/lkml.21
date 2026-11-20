Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180232;
	b=gLVF99KGvgNfJHhw+mHjd94oxCatPvU4dtSz9xcHwcXf2C7huZRER5CiMbD8ChFXM/gK
	 fYS+7BYoxYKnAAlQuD/S0jcQgBEM+0MU4axTPQVTuqL5rf+BPz7DXvxNtAm/FPcRhASWa
	 dU3JvkZpLoJyYjplUrXaLUqCdmIgJQDZzhAMeB9bksmNJICQLZnYHcZV9xPd7zd7JZG+m
	 NSs9ymcb9/RGyOJWJTqLJPCE6jQhXX9a0Kuo6X3/WWW2jARDLrHbCVUUxUCMPfE0GwKak
	 X68ovWUnrR1ttXCDsRIVVT5kxCk1nWMeZb430EZiUScm88SCu2MYFXbvDJusKCw8/HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180232;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:Content-Type:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oC2Xml7xr7+uwxJyejTC2FJlifBGOJbIE+T4dQDTGjM=;
	b=Nt/S590AVzQ32lt0+DF5Wx9rSJoei2+QKBsKTP0C2jJd9gJuITsjOiSjD5qzdzsEOc1o
	 mCgNmydQwAqorfdhN923EPohYAmBqZDtCHkdeI6H9KHlCvxNcSGOIwp0fhYHcByBD6Thd
	 bBCIH6ceKIe8G1gPWRY0DqfgQMRlJnW1rIdAW2KwHS2l9OiFavq2MOsVdaw3VBkYIGvdN
	 NF/JoPu8OHnlPHA3kyLJ9t4PUSQoK/X0ItEbwSsYqbFuRwQpADjZ321uWaXFg7teVoVtW
	 yTqzWwk6gvLFv4gZrrSD8s5aF0FdPdWprHFp3r30kaKF8dDrygiwHFfZJE8YwmXgtIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xE3x1sFp;
	arc=none smtp.remote-ip=95.215.58.222
Received: from mta1.migadu.com (out-222.mta1.migadu.com [95.215.58.222])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAAD60A2602
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BAAD60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xE3x1sFp
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=L59gNiF9CiuuxqSAlrzDgp3oWvnP1Ae2UbpPyCDb2Pw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795180230; v=1; x=1795785030;
 b=xE3x1sFprZ2Exv1s83T0rmoS8Xzt6pAlaDqcK74C2+bebtPInbtqfMkpDMLqGelTGTSwZbc2
 gyc4zlzRD8/ES2K+M4wE25Odycy2D7+cqLb+ZP5ntHJzkjmlz7tUKibx+oTp+EBednOCNqXdt5Q
 vFMP9pW4WYKklecqOvQxYXfs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7e0faf6437fe5d58;
	Fri, 20 Nov 2026 13:10:28 +0000
X-Mizu-Trace-ID: 7e0faf6437fe5d58
X-Migadu-Flow: FLOW_OUT
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>,
	Ping-Ke Shih <pkshih@realtek.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v3 2/5] wifi: rtw88: report the frames purged from the TX report queue
Date: Fri, 20 Nov 2026 14:09:17 +0100
Message-ID: <20261120131000.33858-2-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117171003.1840491-3-mehmet.fide@gmail.com>
References: <20261117171003.1840491-1-mehmet.fide@gmail.com> <20261117171003.1840491-3-mehmet.fide@gmail.com>
Content-Type: text/plain; charset="us-ascii"
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

Hi Mehmet,

Thanks for the patch. One comment below.

On November 17, 2026 6:10:00 PM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:

> +	spin_lock_irqsave(&tx_report->q_lock, flags);
> +	skb_queue_splice_init(&tx_report->queue, &purge);
> +	spin_unlock_irqrestore(&tx_report->q_lock, flags);
> +
> +	ieee80211_purge_tx_queue(rtwdev->hw, &purge);

As far as I can see, an AP peer probe that times out can report an ACK
signal and a link ID from the old TX control fields. On x86_64,
status.flags and status.link_valid overlap control.vif. The firmware
report path clears the status before handing the skb back, but the
purge path passes it straight to mac80211. The timer can do this while
the AP is still up.

ieee80211_report_ack_skb() reads those fields for a null frame even
when it was dropped. cfg80211_probe_status() can then include both
attributes in the event without an ACK. Could we clear the TX status in
rtw_tx_report_enqueue() before saving the sequence number?

Best regards,
Luka Gejak

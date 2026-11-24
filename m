Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534162;
	b=psIoESeNg08Hdvxgw5guYV5a6xfAF3qu3zDNlxOEZouxOvXyP4TnHEHmo7ti3WzyrHz8
	 d5SjTQAdQnED0meSwGePQUCqS1VKL26cvYtNLvc1cXg42WcGFL2GJ2XplCXZwz4/wpyuE
	 Pa5ookVqt7fqfjgdBSKELW91zpLVibyDvAAiXlzjSpE51j2wG21RjvTSUJMDMT2HI1TvR
	 M/+gEtfX+udTbk1mTIzwma2af4IVIG+1nKRu+faL3FLtqgcOZ4FcxpXKjPuAUvHePQRcM
	 Pe7ND9RXS3kL+j5iPRqH8wcxIE1mGJMCAvdU7sMoUAaZfaDOfdg3Vr7T8uH8U1crP9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534162;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=EN5PyVV3ehJxWtE39x1XJbDDj8oLnBoapk60Rvm55Z4=;
	b=C+GPC72pDkIPobdBZNigHBLSXYIBe7QYG4XvVlzIqDZ2ii8BSsgWN577hnUf3sDoZ6I4
	 pCHK7kNGn6s3gcJdnMrdHh5Kc6E69T5sJDizOYKPq10t8+Z9+g4XQQF6WmlR7g5yd6cRZ
	 JGuCdzlAUEU7toOdyUQ2Y2pyON2L6h/OMZOBtY/WSE7UHxx+UN5/c7MkY8mZYWlsl65bb
	 IiYcA3xK1wczIndYuTrfxXlmce6rl93X8gVI41YWl35YJ+n+Mm1b+NewBOpMA0yUryx7x
	 GcK7xKEKwHfcup+o4lFj7UXTlMAvlEqZPq17/qvKyJJeR0icrZBcYHn1Rk42MDrjGdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=efp2P1Rs;
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BAC606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02BAC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=efp2P1Rs
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e0461e040so3639741f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795534160; x=1796138960; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EN5PyVV3ehJxWtE39x1XJbDDj8oLnBoapk60Rvm55Z4=;
        b=efp2P1RseTJXbIkPAe5p75XdnvjWOOAEnyjt9kGQcVi1q0JSOkCGH5+tLS5i6l0m0S
         KllQqcJQVOouCoNdK/cxLK9GqACHce9vNg/pQKNFzlAmEajOBX+cLQmxdO4NFkn3/i0J
         VKLZog0G7eo+EA/XTiPmW2PgxsjelJCNWRHCfNKPhJCCKGHpNW/ETnRdJxoPyL3MfsxN
         Psh9x2vTVAO5uxF6DT8yFVdaQ0j8ZRHxlhQlhwatPoFOED5gQkAyyTkXfC9GNvB/+Ldj
         ffBv9VIrwCxcb89n6Pkh7MKwnCPuAmZbiXYCg7abSMHcjcjebWmfLsWcGJucSkUEhPUS
         9HZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534160; x=1796138960;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EN5PyVV3ehJxWtE39x1XJbDDj8oLnBoapk60Rvm55Z4=;
        b=B+fcmyuBQ3vQqLCvDKnFO29X1a2hXUQv104/8Q3KIbzbpbtXNTCXizQqqLioRhF3Pa
         em1eK6tZEeyzHgOf8vasJ+OCf+UwbymQCOzQ53RSrYZR1tm8iULAzrVbB6qkkiNmk+Th
         wMMS2UimbokShiJDHyqtNSMu+ZK3+2FAGbttUJeqOnZgep5TNMt/3M/jw4BLgZrwxvWS
         f4OuRgfkulWjyhmZbS1Y8MCeVnq3no/4YZvoKEOeRSxpysSNO7KA8OpIDNYOu9A5Pjxu
         vgnLKfSCunRRAke2bgV2WCsRPXGXA1qDxFm3eoinK/GTlbREa3/OsCrKADJy6/zNd/FZ
         nHXw==
X-Forwarded-Encrypted: i=1; AL+hErEYiM8Q1s02IPdPkbuoUJm6W5o4p+/6lanMeh1et6ocR4+YcmOz5UoyUgdudu5NmW5TdIkDUlNnAMyDW+U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2TJY/mv0ewWA6FSwhkWBbPOcGX6zyVr3XlLa6o+ba5b2phFU8
	K+kkUrCeEBn+Do7wwV+PM4jYPsXomlnZA5zJMFH9kYSJC6l7lnFrAXjnHZZLAef1d+KjT+pJCH+
	dVCl6wPzrl1gI2ugv/+jqcg==
X-Received: from wrnw9.prod.google.com ([2002:adf:ec49:0:b0:4b7:fd6a:1010])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4617:b0:48d:f464:6989 with SMTP id ffacd0b85a97d-4abb18cbe2cmr29323905f8f.27.1795534160072;
 Tue, 24 Nov 2026 07:29:20 -0800 (PST)
Date: Tue, 24 Nov 2026 15:28:28 +0000
In-Reply-To: <20261124152845.2233401-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261124152845.2233401-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124152845.2233401-5-vdonnefort@google.com>
Subject: [PATCH v9 04/21] tracing/remotes: Initialise pos in trace_start()
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

When *pos is 0, trace_start() passes a dummy local variable i to
trace_next() to fetch the first entry without modifying *pos. In that
branch, i was left uninitialized.

While i is discarded and causes no functional issues, initialise i and
keep static analysers happy.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/trace_remote.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index bd1b26cd981a..6e514e78392f 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -748,12 +748,12 @@ static void *trace_start(struct seq_file *m, loff_t *pos)
 
 	trace_remote_iter_read_start(iter);
 
+	i = iter->pos;
 	if (!*pos) {
 		iter->pos = -1;
 		return trace_next(m, NULL, &i);
 	}
 
-	i = iter->pos;
 	while (i < *pos) {
 		iter = trace_next(m, NULL, &i);
 		if (!iter)
-- 
2.56.1.809.ga0b61035b5-goog


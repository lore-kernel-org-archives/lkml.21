Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.0
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765986;
	b=VDWiWJaYI3n5g+wmGLSKrfEzPNAT7FRJuyQxWokiLBhQB9LvqSRbszDS5XXwq1TV+Flo
	 GJMZErtYCFBaDBVHggjwnBhXwBxczQGbHJ9tderK19iG2TE/HKAYmlY56Q2DiQNXHqmfX
	 DZHUtqvFgcH3FZVejEYaG10BXxGDnKhxKYNQLAO9sjVX4z4M8MhzLRspf2AKaukua7Z0L
	 2eXtiiBQCdokKhvOoh/oBi51Hqd/+s/vu6VzfLAIXiHjt1IGcim1dpC2Ms75NpIHMU+AH
	 1zw+tUrgijTWTkxm4QwtgNF+zf44h6OB2+L/Fa3xxslbzw2ay+WKtHEZSZpsu0KgIAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sBmxjzdiafnCpbslTA23MdOV/+0wR1vP5XxuJoSYTDM=;
	b=YCyAA6/WM3klZKG/iZhVEHLXXEmtIZunm8u+WcmmbnhXpmIAAUJd2NX0VMPIw1wPtmqt
	 3OM6a74X+UOCAIU5tbs8VsWdc0dVVbMoa6Q+nuzG800Gf3od6aPrSII/8QdCwbswQaELL
	 WvpvCflYNNeAtZxbzzgmgjt7YnPKhG7EkuH8o3NXLRhAiUwyKShLWxRwJE0LDS8h9nUra
	 Uhdrctvtv59AXdWj3gxaF1spSwzQCexAAy+SXurRWngpgLKhyXQIyEKT1mqM6IuiGX0cD
	 RCJ7bgg/+7HC72P/rLnBbWCTZK3aTY+vB1okAevxfUwh82S2OW4cx8EGRjmJzxnhAKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tielNRry;
	arc=none smtp.remote-ip=74.125.229.0
Received: from mail-dy2-f0.google.com (mail-dy2-f0.google.com [74.125.229.0])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D98A606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D98A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tielNRry
Received: by mail-dy2-f0.google.com with SMTP id 5a478bee46e88-3117f9b9e64so770076eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 23:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795765986; x=1796370786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sBmxjzdiafnCpbslTA23MdOV/+0wR1vP5XxuJoSYTDM=;
        b=tielNRryIeBmA5JxCRqsXoY1Pt3Osdn1Mnzu/w4tUV1wMpCqJjIksakyrHBhAC0rQ5
         ammzMzFtFpwHqniMnhmwXbtJqDp51zff7isFFgisn96Xa0Vo5Gq8n3uu/zJbnsDKItHq
         ZlA/hphgL51ciKEYTCRJhQD53XV62fGivBFRMr07UAlOoe60QojE/MrRDpWMXaZ/v/Gr
         apiFIiIZP7ynCzVjH+S3CMPXtffOf9Am+Wfx8n86K8FnnemwWJvz2JdG2phwlquYixtL
         R8pfQK5UYzQw2NIjHIZUhbZ0R4WfP1kTXILPWUWfL579YNVXlh8lRNEaK5QnufIVjgzJ
         cQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795765986; x=1796370786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sBmxjzdiafnCpbslTA23MdOV/+0wR1vP5XxuJoSYTDM=;
        b=fK+kv10Lp+kirsxzKIjYaeQIOJv2FQR+eoYMQobQeGUqGKsUOgFljju1u3L/SZi+YN
         5cHiUkFSUufhWzrhHl5oyuFaRtoZfbAvcTLj90sXN9dI5iACv2YC+sqDiEAi1ke2CBbV
         9cOZGyHP0rqg3yY92z9GmYLO4yMIhXCWDzfk/kwaGdRGh2cU0zbE/Zi+3OyOqhq3Yl6q
         ezB4BV3UJIpEm21zFO4zL30uoV1/kGBaVBkIPEx8zG6CC7wY3i44fR8MoCQmlanfBglq
         Haa8O0nHf1KwTssREmOmWiFs5Ui4Dzou+a2W8A9X7O+mAudZKezvAij++3d6wUtWi34h
         +/PQ==
X-Forwarded-Encrypted: i=1; AL+hErHEPS0AvD2kQ50Q7WVVzyFE5MjQVVfAaxoDrhJ28kFOd0LZ+bXJD6PaKWMB+t98bWgJz+KomN+TKwkCuxY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bRCROJs9AtPy0UlGXINN/FB/QLC1kCy55u8Y50eRGufVgyTlc
	ymLB2OQfBYy6S2atO66cjDwjLWxJMEeQ+IrokOZcErmogjFVC5gwrmenVAgep1nyV3c=
X-Gm-Gg: AZFdTZczlUdMy0BQrzbFncUlFZLNZELOJYlZ5/VxcdPUrqgbHndnZTdftQdYZ11pZD+
	Jg1ZM54dTBNEsfQgbCxB7vBcuMYEqMp1TjmXk0YvTTdC3DUWF+If2Ch4b/sGD2X76wBqQDqzkie
	vrut3oU69bxehiNnnQYcUwYLeKKEbp86XvUFKMcZHtmu1wyENA6txWl0iEe/bnX3FJ3fvdCG+FN
	cBEul4T69q7Lg3EHIm9v1evWyoPr6iPjDbGyV+1ik5UpudGTq9V6C9C4Nrgv6kZxK0/e5GW9sIM
	XpijqY8yqnja5tLPKN17YqpXM4do9e+RX0znyQcN+DZhRapSwtC2qJdNew14pDhfQkF0wb53Q4Y
	3HCKTbCeIU2lsGgJH5mP8Ftbqg3dvwl0FrD/kSrf3TWMikOiyTU/HXEEopnsNH+lQtc0IoNAGi2
	TNbHPw6cmNeRcU20ytbw2fgdePuzAA8mawwxdDLy53cDCckodhtU/2Q2LfaWLKf4xu7BMsRB2c0
	A9LrVUplx0qUefQAxRxSKv4+2/VjP65zcNz9hPWRlSanU/7UeRXqkwU11FOGqDFKdct6F8Krna0
	XyPUdRi66MksTMLgnykehVCF+xVtx+n86p0GhKzyLNN4ddrpEKHyeiEJ
X-Received: by 2002:a05:693c:414d:20b0:382:cd5e:dc9e with SMTP id 5a478bee46e88-3869a1501f1mr23164796eec.13.1795765985470;
        Thu, 26 Nov 2026 23:53:05 -0800 (PST)
Received: from jiayi-vm-sprl-server17.local ([155.69.195.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm72835501eec.6.2026.11.26.23.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:53:05 -0800 (PST)
From: Jiayi Zhang <zhangjiayi1014@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rui Miguel Silva <rui.silva@linaro.org>,
	Farhad Alemi <farhad.alemi@berkeley.edu>,
	greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	syzbot+e6bea924b5ee24f7cb98@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	Jiayi Zhang <zhangjiayi1014@gmail.com>
Subject: [PATCH] greybus: svc_watchdog: initialize reset_work only once
Date: Fri, 27 Nov 2026 07:52:43 +0000
Message-ID: <20261127075243.3413794-1-zhangjiayi1014@gmail.com>
X-Mailer: git-send-email 2.53.0
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

reset_work is a file-scope delayed work shared by all SVC watchdogs, but
do_work() calls INIT_DELAYED_WORK() on it every time a ping fails, right
before scheduling it to run half a second later. With two host devices,
the watchdog of the second SVC can see its ping fail while the work
scheduled by the first one is still pending. INIT_DELAYED_WORK() then
reinitializes a timer that is still enqueued, and debugobjects reports:

  greybus 1-svc: Resetting the greybus network, watch out!!!
  greybus 2-svc: Resetting the greybus network, watch out!!!
  ODEBUG: init active (active state 0) object: ffffffff9bda1f68 object type: timer_list hint: greybus_reset+0x0/0x50
  WARNING: lib/debugobjects.c:629 at debug_print_object+0x198/0x2b0
  Workqueue: events do_work
  Call Trace:
   __debug_object_init
   timer_init_key
   do_work drivers/greybus/svc_watchdog.c:92
   process_one_work

Without CONFIG_DEBUG_OBJECTS_TIMERS nothing catches this and the timer
is added to the timer wheel a second time while it is still linked there.

Initialize reset_work once with DECLARE_DELAYED_WORK() and only schedule
it from do_work(). schedule_delayed_work() does nothing when the work is
already pending, which is what is wanted here: greybus_reset() resets the
whole greybus network, so one run serves both watchdogs.

Fixes: ed7279ae31b0 ("greybus: svc: add a "watchdog" to check the network health")
Reported-by: syzbot+e6bea924b5ee24f7cb98@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e6bea924b5ee24f7cb98
Link: https://lore.kernel.org/r/CA+0ovCiyBFo_gx4UaRN095=MdWaBgKm=TqA1uYdOu-hb_BPt6A@mail.gmail.com/
Signed-off-by: Jiayi Zhang <zhangjiayi1014@gmail.com>
---
Compile tested only (allmodconfig, W=1); syzbot has no reproducer for
this report.

AI tools assisted with the analysis, the code and the changelog.

 drivers/greybus/svc_watchdog.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/greybus/svc_watchdog.c b/drivers/greybus/svc_watchdog.c
index b318eb34bcca..11eb7c961b06 100644
--- a/drivers/greybus/svc_watchdog.c
+++ b/drivers/greybus/svc_watchdog.c
@@ -20,8 +20,6 @@ struct gb_svc_watchdog {
 	struct notifier_block pm_notifier;
 };
 
-static struct delayed_work reset_work;
-
 static int svc_watchdog_pm_notifier(struct notifier_block *notifier,
 				    unsigned long pm_event, void *unused)
 {
@@ -61,6 +59,8 @@ static void greybus_reset(struct work_struct *work)
 	call_usermodehelper(start_path, argv, envp, UMH_WAIT_EXEC);
 }
 
+static DECLARE_DELAYED_WORK(reset_work, greybus_reset);
+
 static void do_work(struct work_struct *work)
 {
 	struct gb_svc_watchdog *watchdog;
@@ -89,7 +89,6 @@ static void do_work(struct work_struct *work)
 		} else if (svc->action == GB_SVC_WATCHDOG_BITE_RESET_UNIPRO) {
 			dev_err(&svc->dev, "Resetting the greybus network, watch out!!!\n");
 
-			INIT_DELAYED_WORK(&reset_work, greybus_reset);
 			schedule_delayed_work(&reset_work, HZ / 2);
 
 			/*

base-commit: 9437ee8b6cf607e883b36e44bd755968daaebd48
-- 
2.53.0

